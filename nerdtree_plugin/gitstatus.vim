hi! NERDTreeGitStatusModified guifg=#ff5a58
hi! NERDTreeGitStatusStaged guifg=#92ff7f
hi! NERDTreeGitStatusUntracked guifg=#fbff75
hi! NERDTreeGitStatusRenamed guifg=#ff5a58
hi! NERDTreeGitStatusUnmerged guifg=#ff5a58
hi! NERDTreeGitStatusDeleted guifg=#ff5a58
hi! NERDTreeGitStatusDirty guifg=#ff5a58
hi! NERDTreeGitStatusClean guifg=#ff5a58
hi! NERDTreeGitStatusUnknown guifg=#ff5a58

call g:NERDTreePathNotifier.AddListener("init", "NERDTreeGitStatus")
call g:NERDTreePathNotifier.AddListener("refresh", "NERDTreeGitStatus")
call g:NERDTreePathNotifier.AddListener("refreshFlags", "NERDTreeGitStatus")

function! NERDTreeGitStatus(event)
  let subject = a:event.subject

  call s:NERDTreeGitStatus.worker.new(subject.pathSegments, subject.isDirectory).run()
endfunction

let s:NERDTreeGitStatus = {
      \ "worker": {},
      \ "matches": {}
      \ }

function! s:NERDTreeGitStatus.worker.new(pathSegments, isDirectory)
  let matchKey = join(a:pathSegments, "%")

  return extend(copy(s:NERDTreeGitStatus.worker), {
        \ "name": "nerdtree-githighlight",
        \ "pathSegments": a:pathSegments,
        \ "isDirectory": a:isDirectory,
        \ "matchKey": matchKey,
        \ "stdout": 0
        \ })
endfunction

function! s:NERDTreeGitStatus.worker.run()
  let argv = [&sh, &shcf, "git status --porcelain -- /" . join(self.pathSegments, "/")]

  call jobstart(argv, self)
endfunction

function! s:NERDTreeGitStatus.worker.on_exit()
  if !self.stdout && has_key(s:NERDTreeGitStatus.matches, self.matchKey)
    call matchdelete(s:NERDTreeGitStatus.matches[self.matchKey])
    call remove(s:NERDTreeGitStatus.matches, self.matchKey)
  end
endfunction

function s:NERDTreeGitStatus.worker.on_stdout(job_id, data)
  if !empty(a:data)
    if !has_key(s:NERDTreeGitStatus.matches, self.matchKey)
      let status = strpart(a:data[0], 0, 2)
      let status_name = self.parseStatus(status)
      call self.highlight(status_name)
    end

    let self.stdout = 1
  endif
endfunction

function! s:NERDTreeGitStatus.worker.highlight(name)
  let fname = self.pathSegments[-1]

  if self.isDirectory
    let fname = fname . "/"
  end

  let match_id = matchadd("NERDTreeGitStatus".a:name, "^.*".fname."$")
  let s:NERDTreeGitStatus.matches[self.matchKey] = match_id
endfunction

function! s:NERDTreeGitStatus.worker.parseStatus(status)
  let us = strpart(a:status, 0, 1)
  let them = strpart(a:status, 1, 1)

  if us == "?" && them == "?"
    return "Untracked"
  elseif us == " " && them == "M"
    return "Modified"
  elseif us =~# "[MAC]"
    return "Staged"
  elseif us == "R"
    return "Renamed"
  elseif us == "U" || them == "U" || us == "A" && them == "A" || us == "D" && them == "D"
    return "Unmerged"
  elseif them == "D"
    return "Deleted"
  else
    return "Unknown"
  endif
endfunction

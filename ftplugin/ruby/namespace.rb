# frozen_string_literal: true

require 'ripper'

class Namespace
  Token = Struct.new(:position, :type, :token, :state) do
    CONTINUE_TOKENS = %i[on_const on_sp on_op].freeze

    def line
      position[0].to_i
    end

    def begin?
      type == :on_kw && token != 'end'
    end

    def end?
      type == :on_kw && token == 'end'
    end

    def continue?
      CONTINUE_TOKENS.include?(type)
    end
  end

  class NamespaceSet
    def initialize
      @namespace_set = []
    end

    def new(value)
      exec { namespace_set.push([value]) }
    end

    def continue(value)
      exec { namespace_set.last.push(value) }
    end

    def remove
      exec { namespace_set.pop }
    end

    def format
      namespace_set
        .flatten
        .reject(&method(:reject?))
        .map(&:token)
        .join('::')
    end

    private

    attr_reader :namespace_set

    def exec
      yield
      self
    end

    def reject?(token)
      %i[on_kw on_sp].include?(token.type) || token.token == '::'
    end
  end

  def initialize(file)
    @path, self.stop_line, = file.to_s.split(':')
  end

  def fetch
    @path
      .then { |path| File.read(path) }
      .then { |file| Ripper.lex(file) }
      .then { |tokens| parse(tokens) }
      .format
  end

  private

  attr_reader :stop_line

  def stop_line=(value)
    stop_line = value.to_i
    @stop_line = stop_line.zero? ? 1 : stop_line
  end

  def parse(tokens, namespace_set = NamespaceSet.new)
    return namespace_set if tokens.empty?

    current, *tokens = tokens
    token = Token.new(*current)

    return namespace_set if token.line == stop_line

    parse_token(token, tokens, namespace_set)
  end

  def parse_token(token, tokens, namespace_set)
    if token.end?
      parse(tokens, namespace_set.remove)
    elsif token.begin?
      parse(tokens, namespace_set.new(token))
    elsif token.continue?
      parse(tokens, namespace_set.continue(token))
    else
      parse(tokens, namespace_set)
    end
  end
end

print Namespace.new(ARGV[0]).fetch

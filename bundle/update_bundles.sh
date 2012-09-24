#!/bin/bash

for f in $(ls -1); do
	echo "Updating submodule $f";
	cd vim-visual-star-search;
	git co master;
	git pull;
	echo "=====================";
	cd ..;
done

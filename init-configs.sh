bdep deinit -a && bdep config remove -a
rm -rf .bdep build-* install

bpkg create -d build-common cc
bpkg create -d build-debug  cc config.cxx=clang++ config.install.root=./install/debug
bpkg create -d build-release  cc config.cxx=clang++ config.install.root=./install/release

bdep init --empty

bdep config add build-debug @debug
bdep config add build-release @release
bdep config add build-common @common

bdep config link @debug @common
bdep config link @release @common

bdep init -d bbb/ @common
bdep init -d aaa @debug @release

bdep test @release @debug
b install: build-debug/aaa/
b install: build-release/aaa/

cd install/debug/bin/
./aaa  # Will crash because bbb shared library was not installed with aaa's files.


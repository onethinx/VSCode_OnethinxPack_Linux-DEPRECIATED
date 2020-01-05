#!/bin/bash
make -f CMakeFiles/$1.elf.dir/build.make CMakeFiles/$1.elf.dir/build -q
if [ $? == 0 ] 
then
    printf "Build is OK :-)\n"
    exit 0
fi
if [ $? == 1 ] 
then
    printf "**** Please build project first. ****\n\n"
    exit 1
else
    printf "**** Please fix build errors. ****\n\n"
fi
exit 2
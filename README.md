```bash
make
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)
./prog
```

you should see this
```
root@stest:~/src/so_ex# ./prog
ctest1() -> 5
ctest2() -> 100
```

if you forgot set env var you will see this error
`./prog: error while loading shared libraries: libctest.so.1: cannot open shared object file: No such file or directory`


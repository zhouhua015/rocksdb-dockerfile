# rocksdb-dockerfile

A CentOS 7 devtoolset-7 based rocksdb compiling environment

## Dependencies of rocksdb
gflags/snappy(-devel)/zlib(-devel)/bzip2(-devel)/lz4-devel/zstandard

## Build
1. Clone the repository
``` bash
git clone https://github.com/zhouhua015/rocksdb-dockerfile.git
```
2. Change the last line to your user id, or make sure user id 1001 can write to source directory
```
USER 1001 # make sure it can write to source directory of rocksdb
```
3. Build your own image with:
``` bash
docker build -t [XXX]/rocksdb .
```

## Run
``` bash
docker run -ti --rm -v /path/to/rocksdb-src:/opt/app-root/src:z [XXX]/rocksdb make static_lib
```

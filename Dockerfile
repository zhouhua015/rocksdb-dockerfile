FROM centos/devtoolset-7-toolchain-centos7

USER 0

RUN yum install -y --setopt=tsflags=nodocs \
    make git wget which automake \
    snappy snappy-devel \
    zlib zlib-devel bzip2 bzip2-devel \
    lz4-devel libasan && yum clean all -y

# Install cmake 3.9
RUN wget https://cmake.org/files/v3.9/cmake-3.9.0-Linux-x86_64.sh && \
    bash cmake-3.9.0-Linux-x86_64.sh --skip-license --prefix=/usr/local

RUN wget https://github.com/facebook/zstd/archive/v1.1.3.tar.gz && \
   mv v1.1.3.tar.gz zstd-1.1.3.tar.gz && \
   tar zxvf zstd-1.1.3.tar.gz && \
   cd zstd-1.1.3 && \
   make && make install

RUN git clone https://github.com/gflags/gflags.git && \
    cd gflags && \
    git checkout v2.0 && \
    ./configure && make && make install

RUN rm -rf gflags zstd-1.1.3 ztsd-1.1.3.tar.gz cmake-3.9.0-Linux-x86_64.sh

# make sure cmake is in path
ENV PATH=/opt/cmake/bin:$PATH
# ensure gflags include/lib path
ENV CPATH=/usr/local/include:$CPATH
ENV LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
USER 1001

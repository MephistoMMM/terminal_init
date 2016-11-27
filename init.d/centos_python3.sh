
yum install zlib-devel bzip2-devel openssl-devel ncurese-devel

CP_PATH=$GENPATH/tmp/centospython
if [ -e $CP_PATH ]; then
    cd $CP_PATH
    cd Python-3.5.1
    make clean
else
    mkdir -p $CP_PATH
    cd $CP_PATH
    wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tar.xz
    tar Jxvf Python-3.5.1.tar.xz
    cd Python-3.5.1
fi

./configure --prefix=/usr/local/python3
make && make install

ln -s /usr/local/python3/bin/python3.5 /usr/bin/python3.5
ln -s /usr/bin/python3.5 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

PY_VERSION=3.7.0
PY_VERSION_ALIAS=3.7

yum install -y gcc zlib-devel bzip2-devel openssl-devel ncurese-devel libffi-devel

CP_PATH=$GENPATH/tmp/centospython
if [ -e $CP_PATH ]; then
    cd $CP_PATH
    cd Python-$PY_VERSION
    make clean
else
    mkdir -p $CP_PATH
    cd $CP_PATH
    wget https://www.python.org/ftp/python/$PY_VERSION/Python-$PY_VERSION.tar.xz
    tar Jxvf Python-$PY_VERSION.tar.xz
    cd Python-$PY_VERSION
fi

./configure --prefix=/usr/local/python3
make && make install

ln -s /usr/local/python3/bin/python$PY_VERSION_ALIAS /usr/local/bin/python$PY_VERSION_ALIAS
ln -s /usr/local/bin/python$PY_VERSION_ALIAS /usr/local/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/local/bin/pip3
ln -s /usr/local/bin/python$PY_VERSION_ALIAS /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

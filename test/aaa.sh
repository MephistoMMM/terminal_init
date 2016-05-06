
uname -r | grep 'ARCH'
if [ $? = 0  ]; then 
    echo -e "success"
else 
    echo -e "failed"
fi


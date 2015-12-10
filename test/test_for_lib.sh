source ../lib/package.sh

is_archlinux
if [ $? -eq 0 ]; then 
    echo -e "success"
else 
    echo -e "failed"
fi


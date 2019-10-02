valid_ips=()

test_ip()
{
    echo "test" | nc $1 $2;
    if [ $? -eq 0 ];
    then
        valid_ips+=($1)
    fi
}

for i in $(seq 1 255);
do
    test_ip 10.10.252.$i $1 &
done

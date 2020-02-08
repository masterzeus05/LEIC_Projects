#!/bin/bash
pathExe=$1
values=(5 6 7 8 9 10)

for i in "${values[@]}";
do
    test=$(($i*10**3))
    echo "Test:"$i

    aux=$(echo $test/4 | bc)
    #largura=$(( ( RANDOM % ($aux-100) ) + 101 ))
    largura=40
    nCamadas=$(echo $test/$largura | bc)
    camCorte=$(( ( RANDOM % $nCamadas ) + 1 ))
    #regul=$(( ( RANDOM % $largura ) + 1 ))
    #regul=$(echo $largura-2 | bc)
    regul=20

    ./gerador $largura $regul $nCamadas $camCorte 2 > T$i.in

    ts=$(date +%s%N)
    ./$pathExe < T$i.in > /dev/null
    echo $((($(date +%s%N) - $ts)/1000000)) milisseconds

    #rm T$i.in
done

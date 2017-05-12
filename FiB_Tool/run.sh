#!/bin/bash
if [ $# -ne 1 ] 
then
	echo "run with a parameter -fd, -bd, or -bi, exiting"
	exit 1
fi
fib_root=$(pwd)
fib=$fib_root/FiB
benchmarks=$fib_root/benchmarks
outdir=out-fib$1
timelog=time-fib$1.txt

rm -rf $outdir
mkdir $outdir

rm -rf $timelog

for file in $(ls $benchmarks);do
	echo "----------------------------------------------"
	echo run FiB for file $file
	echo run FiB for file $file>>$timelog
	/usr/bin/time -f "%E real\n%U user\n%S sys" -a -o $timelog timeout 200s $fib $1 $benchmarks/$file > $outdir/$file.txt
	echo "----------------------------------------------"
done

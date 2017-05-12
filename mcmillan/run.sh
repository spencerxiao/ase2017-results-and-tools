#!/bin/bash
mcmillan_root=$(pwd)
fib=$mcmillan_root/fib
benchmarks=$mcmillan_root/Impt_Examples
outdir=out-mcmillan
timelog=time-mcmilan.txt
rm -rf $outdir
mkdir $outdir

rm -rf $timelog

for file in $(ls $benchmarks);do
	echo "----------------------------------------------"
	echo run mcmillan for file $file
	echo run mcmillan for file $file>>$timelog
	/usr/bin/time -f "%E real\n%U user\n%S sys" -a -o $timelog timeout 200s $fib -impt -mathsat $benchmarks/$file > $outdir/$file.txt
	echo "----------------------------------------------"
done

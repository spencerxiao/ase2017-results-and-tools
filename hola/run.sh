#!/bin/bash
hola_root=$(pwd)
abductor=$hola_root/framework/build/abductor/abductor
benchmarks=$hola_root/benchmark
sailgcc=$hola_root/gcc/bin/gcc
rt_dir=$hola_root/framework/compass/runtime/
compass_rt=compass-runtime.h
saildir=sail-out
outdir=out-hola
timelog=time-hola.txt

rm -rf $saildir
mkdir $saildir

rm -rf $outdir
mkdir $outdir

rm $timelog

for cfile in $(ls $benchmarks);do
	echo generating sail file for $cfile
	$sailgcc -include $compass_rt -c -I$rt_dir --sail=$saildir/$cfile $benchmarks/$cfile
done

echo deleting compiler binary outputs
rm *.o

for sail in $(ls $saildir);do
	echo running abductor for $sail 
	echo running abductor for $sail>>$timelog 
	/usr/bin/time -f "%E real\n%U user\n%S sys" -a -o $timelog timeout 200s $abductor $saildir/$sail main>$outdir/$sail.txt
done





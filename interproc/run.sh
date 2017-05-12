#!/bin/bash
interproc_root=$(pwd)
interproc=$interproc_root/interproc.byte
benchmarks=$interproc_root/oopsla13-benchmarks-interproc/
outdir=out-interproc
timelog=time-interproc.txt

rm -rf $outdir
mkdir $outdir

rm $timelog

for splfile in $(ls $benchmarks);do
	echo "---------------------------------------------------------------"
	echo run interproc for file $splfile
	echo run interproc for file $splfile>>$timelog
	/usr/bin/time -a -f "%E real\n%U user\n%S sys" -o $timelog $interproc -domain polkagrid $benchmarks$splfile>$outdir/$splfile.txt
	echo "---------------------------------------------------------------"
done

#!/bin/bash

blast_root=$(pwd)
blast=$blast_root/bin/pblast.opt
benchmarks=$blast_root/oopsla13-benchmarks-blast
inputdir=$blast_root/blast-input
outdir=out-blast
timelog=time-blast.txt

rm -rf $inputdir
mkdir $inputdir

rm -rf $outdir
mkdir $outdir

rm $timelog

export PATH=$blast_root/bin:$PATH

for cfile in $(find $benchmarks -type f -name "*.c" -printf "%f ");do
	echo "---------------------------------------------------------------"
	echo generate blast input for file $cfile
	gcc -E -I $benchmarks $benchmarks/$cfile >$inputdir/$cfile.i
	echo "---------------------------------------------------------------"
done

for ifile in $(ls $inputdir);do
	echo "---------------------------------------------------------------"
	echo run blast for file $ifile
	echo run blast for file $ifile>>$timelog
	/usr/bin/time -f "%E real\n%U user\n%S sys" -a -o $timelog timeout 200s $blast -craig 2 -systime -main main $inputdir/$ifile >$outdir/$ifile.txt
	echo "---------------------------------------------------------------"
done

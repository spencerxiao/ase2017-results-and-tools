#!/bin/bash
cpa_root=$(pwd)
cpachecker=$cpa_root/scripts/cpa.sh
benchmarks=$cpa_root/benchmarks
timelog=time-cpachecker.txt
outdir=out-cpachecker

rm -rf $timelog
rm -rf $outdir
mkdir $outdir

for file in $(ls $benchmarks);do
	echo "----------------------------------------------"
	echo run cpachecker for file $file
	echo run cpachecker for file $file>>$timelog
	/usr/bin/time -f "%E real\n%U user\n%S sys" -a -o $timelog timeout 200s $cpachecker -config config/predicateAnalysis.properties $benchmarks/$file
	# renaming the output directory
	rm -rf $outdir/$file
	mv output $outdir/$file
	echo "----------------------------------------------"
done

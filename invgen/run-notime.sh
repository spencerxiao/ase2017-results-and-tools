#!/bin/bash

invgen_root=$(pwd)
frontend=$invgen_root/frontend
invgen=$invgen_root/invgen
benchmarks=$invgen_root/oopsla13-benchmarks-invgen/
frontenddir=frontend-out
outdir=out-invgen

rm -rf $frontenddir
mkdir $frontenddir

rm -rf $outdir
mkdir $outdir

for cfile in $(ls $benchmarks);do
	echo generating the invgen input format for file $cfile
	$frontend -main main -o $frontenddir/$cfile.pl -domain 2 $benchmarks$cfile
done

for plfile in $(ls $frontenddir);do
	echo "#############################################"
	echo running invgen for $plfile 
	time timeout 200s $invgen -stop-on-bad-input $frontenddir/$plfile >$outdir/$plfile.txt
done





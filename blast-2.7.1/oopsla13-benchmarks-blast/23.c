#include "assert.h"

/*
 * ex49 from NECLA Static Analysis Benchmarks
 */


void main(int n){
   int i, sum=0;
   if (!(n >= 0))
     return;

   for (i=0; i < n; ++i)
      sum = sum +i;

   assert(sum >= 0);
}


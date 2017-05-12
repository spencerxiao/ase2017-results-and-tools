#include "assert.h"

/*
 * Based on ex3 from NECLA Static Analysis Benchmarks
 */


void main()
{
  int j=0;
  int i;
  int x=100;
   
   
  for (i =0; i< x ; i++){
    j = j + 2;
  }

  assert(j == 2*x);
}



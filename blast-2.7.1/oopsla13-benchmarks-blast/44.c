#include "assert.h"

/*
 * Adapted from ex20 from NECLA Static Analysis Benchmarks
 */


void main(int k, int flag)
{
  int i=0;
  int j=0;
  int n;
  
  if (flag == 1){
     n=1;
  } else {
     n=2;
  }

  i=0;

  while (i <= k){
    i++;
    j= j +n;
  }

  if(flag == 1)
    assert(j == i);
	
}



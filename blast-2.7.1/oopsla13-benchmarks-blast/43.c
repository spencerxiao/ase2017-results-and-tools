#include "assert.h"

/*
 * Based on ex16 from NECLA Static Analysis Benchmarks
 */


void main(int x, int y)
{
  int i=0;
  int t=y;
  int __BLAST_NONDET; 
  if (x==y) return x;
  
  while (__BLAST_NONDET){
    if (x > 0)   
      y = y + x;
  }
   
  assert(y>=t);
}



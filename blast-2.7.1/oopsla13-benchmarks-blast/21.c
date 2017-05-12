#include "assert.h"

/*
 * Based on "larg_const.c" from InvGen test suite  
 */

void main() {
  int c1 = 4000;
  int c2 = 2000;
  int n, v;
  int i, k, j;
  int __BLAST_NONDET;

  if (!(n>0))
    return;
  if (!(n<10))
    return;

  k = 0;
  i = 0;
  while( i < n ) {
    i++;
    if(__BLAST_NONDET % 2 == 0) 
      v = 0;
    else v = 1;
    
    if( v == 0 )
      k += c1;
    else 
      k += c2;
  }
  
  assert(k>n);
}


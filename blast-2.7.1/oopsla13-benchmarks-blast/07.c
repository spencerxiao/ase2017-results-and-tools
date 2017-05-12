#include "assert.h"

/*
 * From "Path Invariants" PLDI 07 by Beyer et al.
 */

void main() {
  int i, n, a, b;
  int __BLAST_NONDET;

  if (!(n >= 0)) {
   return;
  }

  i = 0; a = 0; b = 0;
  while( i < n ) {
    if(__BLAST_NONDET) {
      a = a+1;
      b = b+2;
    } else {
      a = a+2;
      b = b+1;
    }
    i = i+1;
  }
  assert( a+b == 3*n );

}

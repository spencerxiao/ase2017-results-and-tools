#include "assert.h"

/*
 * Based on "Property-Directed Incremental Invariant Generation" by Bradley et al.
 */

void main(int flag) {
   int j = 2; 
   int k = 0;
   int __BLAST_NONDET;
   while(__BLAST_NONDET){ 
     if (flag)
       j = j + 4;
     else {
       j = j + 2;
       k = k + 1;
     }
   }
   if(k!=0)
     assert(j==2*k+2);
}

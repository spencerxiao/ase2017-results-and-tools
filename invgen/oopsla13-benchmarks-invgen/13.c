#include <assert.h>
int __BLAST_NONDET;

/*
 * Based on "Property-Directed Incremental Invariant Generation" by Bradley et al.
 */

void main(int flag) {
   int j = 2; 
   int k = 0;

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

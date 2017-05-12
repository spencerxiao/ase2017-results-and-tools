#include "assert.h"

/*
 * Adapted from "Automated Error Diagnosis Using Abductive Inference" by Dillig et al.
 */

void main(int n, int flag) {
   if(!(n>=0)) 
     return;
   int k = 1;
   int __BLAST_NONDET;// to model non-deterministic
   if(flag) {
	k = __BLASTNODET;
	if(!(k>=0))
          return;
   }
   int i = 0, j = 0;
   while(i <= n) {
     i++;
     j+=i;
   }
   int z = k + i + j;
   assert(z > 2*n);
}


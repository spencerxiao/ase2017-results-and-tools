#include <assert.h>

/*
 * Adapted from "Automated Error Diagnosis Using Abductive Inference" by Dillig et al.
 */

void main(int n, int flag) {
   assume(n>=0);
   int k = 1;
	 int m;
   if(flag) {
		k = m;
		assume(k>=0);
   }
   int i = 0, j = 0;
   while(i <= n) {
     i++;
     j+=i;
   }
   int z = k + i + j;
   assert(z > 2*n);
}


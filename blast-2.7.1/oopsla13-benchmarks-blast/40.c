#include "assert.h"

void main( int flag)
{
   int i, j, k;
   int j = 1;
	 int __BLAST_NONDET;
   if(flag) {i=0;}
   else {i=1;}
   

   while(__BLAST_NONDET) {
      i+=2;
      if(i%2 == 0) {
				j+=2;
      }
      else j++;
   } 
   
   int a = 0;
   int b=0;
   
   while(__BLAST_NONDET) {
      a++;      
      b+=(j-i); 
   }
   if(flag)
     assert(a==b);
}


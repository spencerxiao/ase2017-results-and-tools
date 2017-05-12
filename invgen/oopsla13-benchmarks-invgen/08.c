#include <assert.h>
int __BLAST_NONDET;

/*
 *  Based on "Automatically refining abstract interpretations" fig.1
 */


void main() {
 int x = 0, y = 0;
 while(__BLAST_NONDET){
   if(__BLAST_NONDET){ 
      x++; 
      y+=100; 
   }
   else if (__BLAST_NONDET){ 
      if (x >= 4) { 
          x++; 
          y++; 
      } 
      if (x < 0){
          y--;
      }
   }
  
 }
 assert(x < 4 || y > 2);
}

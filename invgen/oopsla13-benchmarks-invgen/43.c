#include <assert.h>
int __BLAST_NONDET;

/*
 * Based on ex16 from NECLA Static Analysis Benchmarks
 */


int main(int x, int y)
{
  int i=0;
  int t=y;
   
  if (x==y) return x;
  
  while (__BLAST_NONDET){
    if (x > 0)   
      y = y + x;
  }
   
 
  assert(y>=t);
	return 0;
}



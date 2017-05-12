#include "assert.h"

void main(int x, int y, int k, int j, int i, int n)
{
    if(!((x+y)== k)) 
      return;
    int __BLAST_NONDET;
    int m = 0;
    j = 0;
    while(j<n) {
      if(j==i)
      {
         x++;
         y--;
      }else
      {
         y++;
         x--;
      }
      if(__BLAST_NONDET)
        m = j;
      j++;
    }
    assert((x+y)== k);
    if(n>0)
    {
   	assert (0<=m); 
  	assert (m<n);
    }

}


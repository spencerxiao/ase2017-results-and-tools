#include "assert.h"

void main(int flag)
{
  int x = 0;
  int y = 0;

  int j = 0;
  int i = 0;
  int __BLAST_NONDET;
  while(__BLAST_NONDET)
  {
    x++;
    y++;
    i+=x;
    j+=y;
    if(flag)  
      j+=1;
  } 
  assert(j>=i);	
}

#include <assert.h>
int __BLAST_NONDET;

void main()
{
  int w=1, z=0, x=0, y=0;
  while(__BLAST_NONDET){
    while(__BLAST_NONDET){
      if(w%2 == 1) 
        x++;
      if(z%2==0)
        y++;
    }
    while(__BLAST_NONDET)
    {
      z=x+y;
      w=z+1;
    }
  }
  assert(x==y);
}

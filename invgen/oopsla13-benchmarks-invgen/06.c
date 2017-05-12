#include <assert.h>
int __BLAST_NONDET;

void main()
{
  int w = 1;
  int z = 0;
  int x= 0;
  int y=0;

  while(__BLAST_NONDET){
	  
    while(__BLAST_NONDET){
      if(w%2 == 1) x++;
      if(z%2==0) y++;
    }
    z=x+y;
    w=z+1;
  }

  
  assert(x==y);
}

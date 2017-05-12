#include <assert.h>
int __BLAST_NONDET;

void main(int flag)
{
  int x = 1;
  int y = 1;
  int a;
  
  if(flag)
    a = 0;
  else
    a = 1;

  while(__BLAST_NONDET){
    if(flag)
    {
      a = x+y;
      x++;
    }
    else
    {
      a = x+y+1;
      y++;
    }
    if(a%2==1)
      y++;
    else
      x++;	  
  }
  //x==y

  if(flag)
    a++;
  assert(a%2==1);
}

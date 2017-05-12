#include "assert.h"

void main()
{
  int x = 0;
  int y = 0;
  int i = 0;
  int j = 0;
  int __BLAST_NONDET;
  while(__BLAST_NONDET)
  {
    while(__BLAST_NONDET)
    {
       if(x==y)
          i++;
       else
          j++;
    }
    if(i>=j)
    {
       x++;
       y++;
    }
    else
       y++;
  }

  assert(i>=j);
}

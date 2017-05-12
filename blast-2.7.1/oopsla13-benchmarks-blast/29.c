#include "assert.h"

int main()
{
  int a = 1;
  int b = 1;
  int c = 2;
  int d = 2;
  int x = 3;
  int y = 3;
	int __BLAST_NONDET;
  while(__BLAST_NONDET)
  {
    x = a+c;
    y = b+d;
    if((x+y)%2 == 0)
    {
      a++;
      d++;
    }else
    {
      a--;
    }
    while(__BLAST_NONDET)
    {
       c--;
       b--;
    }
  }
  assert(a+c==b+d);
}

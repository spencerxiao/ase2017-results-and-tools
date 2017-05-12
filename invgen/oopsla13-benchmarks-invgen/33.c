#include <assert.h>
int __BLAST_NONDET;

int main(int k)
{
  int z = k;
  int x = 0;
  int y = 0;

  while(__BLAST_NONDET)
  {
    int c = 0;
    while(__BLAST_NONDET)
    {
      if(z==k+y-c)
      {
        x++;
        y++;
        c++;
      }else
      {
        x++;
        y--;
        c++;
      }
    }
    while(__BLAST_NONDET)
    {
      x--;
      y--;
    }
    z=k+y;
  }
  assert(x==y);
}

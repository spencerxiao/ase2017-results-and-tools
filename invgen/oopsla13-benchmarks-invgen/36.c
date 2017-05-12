#include <assert.h>

int __BLAST_NONDET;

void main(int flag)
{
  int a = 0;
  int b = 0;
  int x = 0;
  int y = 0;
  int z = 0;
  int j = 0;
  int w = 0; 

  while(__BLAST_NONDET)
  {
    int i = z;
    int j = w;
    int k = 0;
    while(i<j)
    {
      k++;
      i++;
    }

    x = z;
    y = k;

    if(x%2==1)
    {
      x++;
      y--;
    }

    while(__BLAST_NONDET) 
    {
      if(x%2==0)
      {
        x+=2;
        y-=2;
      }
      else
      {
        x--;
        y--;
      }
    }
    z++;
    w = x+y+1;
  }

  int c=0; 
  int d=0;
  while(__BLAST_NONDET)
  {
    c++;
    d++;
    if(flag)
    {
      a++;
      b++;
    }
    else
    {
      a+=c;
      b+=d;
    }
  }
  assert(w>=z && a-b==0);
}

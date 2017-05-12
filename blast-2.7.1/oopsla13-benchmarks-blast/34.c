#include "assert.h"

void main(int n)
{
  int x=0;
  int y=0;
  int i=0;
  int m=10;
  
 
  while(i<n) {
    i++;
    x++;
    if(i%2 == 0) y++;
  }
  

  if(i==m) 
    assert(x==2*y);
}


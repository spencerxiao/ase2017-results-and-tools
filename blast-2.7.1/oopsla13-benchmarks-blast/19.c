#include "assert.h"

/*
 * From "Simplifying Loop Invariant Generation using Splitter Predicates", Sharma et al. CAV'11
 */


void main(int n, int m)
{
  if(!(n>=0))
    return;

  if(!(m>=0))
    return;

  if(!(m<n))
    return;

  int x=0; 
  int y=m;
  while(x<n) {
    x++;
    if(x>m) y++;
  }
  assert(y==n);
}

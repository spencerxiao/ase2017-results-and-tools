#include <assert.h>

/*
 * From "Simplifying Loop Invariant Generation using Splitter Predicates", Sharma et al. CAV'11
 */


void main(int n, int m)
{
  assume(n>=0);
  assume(m>=0);
  assume(m<n);
  int x=0; 
  int y=m;
  while(x<n) {
    x++;
    if(x>m) y++;
  }
  assert(y==n);
}

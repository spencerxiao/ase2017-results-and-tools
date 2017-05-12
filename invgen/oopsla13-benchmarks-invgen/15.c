#include <assert.h>


/*
 * from Invgen test suite
 */

void main() {

  int n;
  int k, j;
  assume(n >0);

  assume(k>n);
  j = 0;
  while( j < n) {
    j++;
    k--;
  } 
  assert(k>=0);
}

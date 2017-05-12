#include "assert.h"
/*
 * from Invgen test suite
 */

void main() {

  int n;
  int k, j;

  if(!(n>0))
    return;

  if (!(k>n))
    return;

  j = 0;
  while( j < n ) {
    j++;
    k--;
  } 
  assert(k>=0);
}

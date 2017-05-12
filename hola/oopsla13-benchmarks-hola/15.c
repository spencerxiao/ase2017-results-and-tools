#include <assert.h>
int unknown1();
int unknown2();
int unknown3();
int unknown4();

/*
 * from Invgen test suite
 */

void main() {

  int n;
  int i, k, j;


  n = unknown1();
  assume(n>0);

  assume(k>n);
  j = 0;
  while( j < n ) {
    j++;
    k--;
  } 
  assert(k>=0);
}

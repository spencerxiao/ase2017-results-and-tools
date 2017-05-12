#include <assert.h>
int __BLAST_NONDET;


/*
 * From CAV'12 by Sharma et al.
 */

void main() {
  int x=0;
  int y=0;
  int n = 0;
  while(__BLAST_NONDET) {
      x++;
      y++;
  }
  while(x!=n) {
      x--;
      y--;
  }
  assert(y==n);
}

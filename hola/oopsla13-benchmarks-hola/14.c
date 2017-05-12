#include <assert.h>
int unknown1();
int unknown2();
int unknown3();
int unknown4();

/*
 * From "The Octagon Abstract Domain" HOSC 2006 by Mine.
 */

void main() {
  int a = 0;
  int j;
  int m;
  int __BLAST_NONDET;
  if(m<=0)
    return;
  for(j = 1; j <= m ; j++){
    if(unknown1()) 
       a++;
    else
       a--; 
  }
  assert(a>=-m);
  assert(a<=m);
}

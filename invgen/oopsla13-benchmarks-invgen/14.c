#include <assert.h>
int __BLAST_NONDET;

/*
 * From "The Octagon Abstract Domain" HOSC 2006 by Mine.
 */

void main() {
  int a = 0;
  int j;
  int m;
  if(m<=0)
    return;
  for(j = 1; j <= m ; j++){
    if(__BLAST_NONDET) 
       a++;
    else
       a--; 
  }
  assert(a>=-m);
  assert(a<=m);
}

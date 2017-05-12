#include "assert.h"

/*
 * From "A Practical and Complete Approach to Predicate Refinement" by McMillan TACAS'06
 */

void main(int i, int j) {
  
  int x = i;
  int y = j;
 
  while(x!=0) {
	x--;
	y--;
  }

  if(i==j)
    assert(y==0);
}


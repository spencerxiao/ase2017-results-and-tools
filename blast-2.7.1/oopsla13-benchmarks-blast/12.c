#include "assert.h"

int main(int flag)
{
  int t = 0;
  int s = 0;
  int a = 0;
  int b = 0;
	int __BLAST_NONDET;
	while(__BLAST_NONDET){
    a++;
    b++;
    s+=a;
    t+=b;
    if(flag){
      t+=a;
    }
  } 
  //2s >= t
  int x = 1;
  if(flag){
    x = t-2*s+2;
  }
  //x <= 2
  int y = 0;
  while(y<=x){
    if(__BLAST_NONDET) 
       y++;
    else 
       y+=2;
  }
  assert(y<=4);
}


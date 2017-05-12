#include <assert.h>

int __BLAST_NONDET;
/*
 * "fragtest_simple" from InvGen benchmark suite
 */


void main(){
  int i,pvlen ;
  int t;
  int k = 0;
  int n;
  i = 0;

  //  pkt = pktq->tqh_first;
  while (__BLAST_NONDET)
    i = i + 1;
  if (i > pvlen) {
    pvlen = i;
  } else {

  }
  i = 0;

  while (__BLAST_NONDET) {
    t = i;
    i = i + 1;
    k = k +1;
  }
  while (__BLAST_NONDET);

  int j = 0;
  n = i;
  while (1) {
    assert(k >= 0);
    k = k -1;
    i = i - 1;
    j = j + 1;
    if (j < n) {
    } else {
      break;
    }
  }
}

extern int __VERIFIER_nondet_int();
/*
 * Based on "Property-Directed Incremental Invariant Generation" by Bradley et al.
 */

int main(int flag) {
  int j = 2; 
  int k = 0;

  while(__VERIFIER_nondet_int()){ 
    if (flag)
      j = j + 4;
    else {
      j = j + 2;
      k = k + 1;
    }
  }

  if(k!=0) {
    if(!(j==2*k+2)) {
			ERROR: goto ERROR;
		}
	}
}

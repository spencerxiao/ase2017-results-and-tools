extern int __VERIFIER_nondet_int();
/*
 * Taken from "Counterexample Driven Refinement for Abstract Interpretation" (TACAS'06) by Gulavani
 */

void main(int n) {
  int x= 0;
  int m=0;
  while(x<n) {
     if(__VERIFIER_nondet_int()) {
			m = x;
     }
     x= x+1;
  }
  if(n>0) { 
		if(!(0<=m && m<n)) {
			ERROR: goto ERROR;
		}
	}
}

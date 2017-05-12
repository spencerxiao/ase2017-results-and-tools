extern int __VERIFIER_nondet_int();

void __VERIFIER_assume(int i) {
	while (!i);
	return;
}

/*
 * ex49 from NECLA Static Analysis Benchmarks
 */
int main( int n){
   int i, sum=0;
   __VERIFIER_assume(n >= 0);

   for (i=0; i < n; ++i)
      sum = sum +i;

   if(!(sum >= 0)) {
			ERROR: goto ERROR;
	 }
}


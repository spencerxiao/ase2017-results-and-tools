extern int __VERIFIER_nondet_int();

void __VERIFIER_assume(int i) {
	while (!i);
	return;
}
/*
 * from Invgen test suite
 */

int main(int argc, char* argv[]) {

  int i, k, j;

 	int n = __VERIFIER_nondet_int();
  __VERIFIER_assume(n>0);

  __VERIFIER_assume(k>n);
  j = 0;
  while( j < n ) {
    j++;
    k--;
  } 
  
	if(!(k>=0)) {
		ERROR: goto ERROR;
	}

  return 0;
}

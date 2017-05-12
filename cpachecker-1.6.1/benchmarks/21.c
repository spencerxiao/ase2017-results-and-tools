extern int __VERIFIER_nondet_int();

void __VERIFIER_assume(int i) {
  while (!i);
  return;
}

/*
  Baned on "larg_const.c" from InvGen test suite  
 */

int main(int argc, char* argv[]) {
  int c1 = 4000;
  int c2 = 2000;
  int v;
  int i, k, j;


  int n = __VERIFIER_nondet_int();
  __VERIFIER_assume(n>0);
  __VERIFIER_assume(n<10);


  k = 0;
  i = 0;
  while( i < n ) {
    i++;
    if(__VERIFIER_nondet_int() % 2 == 0) 
      v = 0;
    else v = 1;
    
    if( v == 0 )
      k += c1;
    else 
      k += c2;
  }
  
  if(!(k>n)) {
		ERROR: goto ERROR;
	}

  return 0;
}


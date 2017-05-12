extern int __VERIFIER_nondet_int();
/*
 * Based on ex16 from NECLA Static Analysis Benchmarks
 */


int main(int x, int y)
{
  int i=0;
  int t=y;
   
  if (x==y) return x;
  
  while (__VERIFIER_nondet_int()){
    if (x > 0)   
      y = y + x;
  }
   
  if(!(y>=t)) {
		ERROR: goto ERROR;
	}
}



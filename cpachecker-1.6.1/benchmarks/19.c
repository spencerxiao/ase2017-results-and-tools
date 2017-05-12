void __VERIFIER_assume(int i) {
	while (!i);
	return;
}
/*
 * From "Simplifying Loop Invariant Generation using Splitter Predicates", Sharma et al. CAV'11
 */


void main(int n, int m)
{
  __VERIFIER_assume(n>=0);
  __VERIFIER_assume(m>=0);
  __VERIFIER_assume(m<n);
  int x=0; 
  int y=m;
  while(x<n) {
    x++;
    if(x>m) y++;
  }
  if(!(y==n)) {
		ERROR: goto ERROR;
	}
}

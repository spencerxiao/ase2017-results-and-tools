extern int __VERIFIER_nondet_int();

void __VERIFIER_assume(int i)
{
  while (!i);
  return;
}
/*
 * Adapted from "Automated Error Diagnosis Using Abductive Inference" by Dillig et al.
 */

int main(int n, int flag) {
  __VERIFIER_assume(n>=0);
  int k = 1;
  if(flag) {
		k = __VERIFIER_nondet_int();
		assume(k>=0);
  }
  int i = 0, j = 0;
  while(i <= n) {
    i++;
    j+=i;
  }
  int z = k + i + j;
  if(!(z > 2*n)) {
		ERROR: goto ERROR;
	}
}


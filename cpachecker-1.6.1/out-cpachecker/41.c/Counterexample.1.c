int __VERIFIER_nondet_int();
void __VERIFIER_assume(int i);
int main(int n, int flag);
extern void __VERIFIER_error(void);
int main_0(int n, int flag);
void __VERIFIER_assume_1(int i);
int main_0(int n, int flag) {
  __VERIFIER_assume_1(n >= 0);
  int k = 1;
  __CPROVER_assume(!(flag == 0));
  k = __VERIFIER_nondet_int();
  assume(k >= 0);
  int i = 0;
  int j = 0;
  __CPROVER_assume(i <= n);
  int __CPAchecker_TMP_0 = i;
  i = i + 1;
  __CPAchecker_TMP_0;
  j = j + i;
  __CPROVER_assume(!(i <= n));
  int z = (k + i) + j;
  __CPROVER_assume(!(z > (2 * n)));
  __VERIFIER_error(); // target state
}

void __VERIFIER_assume_1(int i) {
  __CPROVER_assume(!(i == 0));
  return;
}

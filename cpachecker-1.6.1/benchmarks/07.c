extern int __VERIFIER_nondet_int();

void __VERIFIER_assume(int i)
{
	while(!i);
	return;
}

void main()
{
	int n;
	__VERIFIER_assume( n >= 0);

	int i = 0;
	int a = 0;
	int b = 0;
	while(i < n) {
		if (__VERIFIER_nondet_int()) {
			a = a+1;
			b = b+2;
		} else {
			a = a+2;
			b = b+1;
		}
		i = i+1;
	}

	if (!(a+b == 3*n)) {
		ERROR: goto ERROR;
	}
}

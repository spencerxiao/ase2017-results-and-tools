extern int __VERIFIER_nondet_int();

void main()
{
	int x = 1;
	int y = 1;
	while(__VERIFIER_nondet_int()) {
		int t1 = x;
		int t2 = y;
		x = t1 + t2;
		y = t1 + t2;
	}

	if (!(y>=1)) {
		ERROR: goto ERROR;
	}
}

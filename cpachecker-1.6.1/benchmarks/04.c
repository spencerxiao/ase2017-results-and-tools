extern int __VERIFIER_nondet_int();

void __VERIFIER_assume(int i)
{
	while(!i);
	return;
}

void main()
{
	int x = -50;
	int y;
	while(x < 0) {
		x = x + y;
		y++;
	}

	if (!(y > 0)) {
		ERROR: goto ERROR;
	}
}

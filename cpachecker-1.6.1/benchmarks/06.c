extern int __VERIFIER_nondet_int();

void main()
{
	int w = 1;
	int x = 0;
	int y = 0;
	int z = 0;
	while(__VERIFIER_nondet_int()) {
		while(__VERIFIER_nondet_int()) {
			if (w%2 == 1) {
				x++;
			}
			if (z%2 == 0) {
				y++;
			}
		}
		z=x + y;
		w=z + 1;
	}

	if (!(x == y)) {
		ERROR: goto ERROR;
	}
}

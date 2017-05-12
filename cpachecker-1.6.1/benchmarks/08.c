extern int __VERIFIER_nondet_int();

void main()
{
	int x = 0;
	int y = 0;
	while(__VERIFIER_nondet_int()) {
		if(__VERIFIER_nondet_int()) {
			x++;
			y += 100;
		} else if (__VERIFIER_nondet_int()) {
			if (x >= 4) {
				x++;
				y++;
			}

			if (x < 0) {
				y--;
			}
		}
	}

	if (!(x < 4 || y > 2)) {
		ERROR: goto ERROR;
	}
}

extern int __VERIFIER_nondet_int();

void main(int flag)
{
	int x = 0;
	int y = 0;
	int j = 0;
	int i = 0;
	while(__VERIFIER_nondet_int()) {
		x++;
		y++;
		i+=x;
		j+=y;
		if (flag) {
			j += 1;
		}
	}

	if (!(j >= i)) {
		ERROR: goto ERROR;
	}
}

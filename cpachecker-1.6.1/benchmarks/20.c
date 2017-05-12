extern int __VERIFIER_nondet_int();

void __VERIFIER_assume(int i) {
	while (!i);
	return;
}

void main(int x, int y, int k, int j, int i, int n)
{
    __VERIFIER_assume((x+y)== k);
    int m = 0;
    j = 0;
    while(j<n) {
      if(j==i)
      {
         x++;
         y--;
      }
			else
      {
         y++;
         x--;
      }
			if(__VERIFIER_nondet_int()) {
  			m = j;
			}
      j++;
    }

    if(!((x+y)== k)) {
			goto ERROR;
		}

    if(n>0)
    {
   		if(!(0<=m)) {
				goto ERROR;
			}
			if(!(m<n)) {
				goto ERROR;
			}
    }

		return;

		ERROR: goto ERROR;

}


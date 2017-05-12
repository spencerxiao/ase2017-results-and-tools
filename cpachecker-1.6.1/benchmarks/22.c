extern int __VERIFIER_nondet_int();

void main()
{
  int x = 0;
  int y = 0;
  int z = 0;
  int k = 0;

  while(__VERIFIER_nondet_int())
  {
     if(k%3 == 0)
       x++;
     y++;
     z++;
     k = x+y+z;
  }

  if(!(x==y)) {
		goto ERROR;
	}
  if(!(y==z)) {
		goto ERROR;
	}

	return;

	ERROR: goto ERROR;
}


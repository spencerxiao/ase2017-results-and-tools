extern int __VERIFIER_nondet_int();

void __VERIFIER_assume(int i)
{
	while (!i);
  return;
}

void main()
{
  int x = 0;
  int y = 0;
  int i = 0;
  int j = 0;

  while(__VERIFIER_nondet_int())
  {
    while(__VERIFIER_nondet_int())
    {
       if(x==y)
          i++;
       else
          j++;
    }
    if(i>=j)
    {
       x++;
       y++;
    }
    else
       y++;
  }

  if(!(i>=j)) {
		ERROR: goto ERROR;
	}
}

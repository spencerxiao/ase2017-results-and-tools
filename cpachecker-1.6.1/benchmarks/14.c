extern __VERIFIER_nondet_int();
/*
 * From "The Octagon Abstract Domain" HOSC 2006 by Mine.
 */

int main() {
  int a = 0;
  int j;
  int m;
  if(m<=0)
    return 0;
  for(j = 1; j <= m ; j++){
    if(__VERIFIER_nondet_int()) 
       a++;
    else
       a--; 
  }

  if(!(a>=-m)) {
		goto ERROR;
	}

  if (!(a<=m)) {
		goto ERROR;
	}

	return 0;

	ERROR: goto ERROR;
}

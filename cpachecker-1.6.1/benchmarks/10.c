extern int __VERIFIER_nondet_int();

void main() {
	int w = 1;
	int z = 0;
	int x= 0;
	int y=0;
  
	while(__VERIFIER_nondet_int()){
	  if(w) {
			x++; 
			w=!w;
	  }

	  if(!z) {
			y++; 
			z=!z;
	  }
	}

	if(!(x==y)) {
		ERROR: goto ERROR;
	}
  
}

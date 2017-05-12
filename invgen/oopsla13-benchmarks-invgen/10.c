#include <assert.h>
int __BLAST_NONDET;

void main() {
	int w = 1;
	int z = 0;
	int x= 0;
	int y=0;

  while(__BLAST_NONDET){
	    if(w) {
		x++; 
		w=!w;
	    };
	    if(!z) {
		y++; 
		z=!z;
	    };
	}

  
	assert(x==y);
  
}

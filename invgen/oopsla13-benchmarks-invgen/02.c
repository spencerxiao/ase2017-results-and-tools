#include <assert.h>
int __BLAST_NONDET;

void main()
{
	int i = 1;
	int j = 0;
	int z = i-j;
	int x = 0;
	int y = 0;
	int w = 0;

	while(__BLAST_NONDET) 
	{
		z+=x+y+w;
		y++;
		if(z%2==1) 
		  x++;
		w+=2; 
	}

	assert(x==y);
}

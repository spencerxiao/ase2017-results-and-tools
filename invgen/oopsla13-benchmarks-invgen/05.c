#include <assert.h>
int __BLAST_NONDET;

void main(int flag)
{

	int x = 0;
	int y = 0;

	int j = 0;
	int i = 0;


	while(__BLAST_NONDET)
	{
	  x++;
	  y++;
	  i+=x;
	  j+=y;
	  if(flag)  j+=1;
	} 
	assert(j>=i);
	
}

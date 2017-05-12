#include <assert.h>
int unknown1();
int unknown2();
int unknown3();
int unknown4();

void main()
{
    int x, y, k, j, i, n;
    assume((x+y)== k);
    int m = 0;
    j = 0;
    while(j<n) {
      if(j==i)
      {
         x++;
         y--;
      }else
      {
         y++;
         x--;
      }
	if(unknown1())
  		m = j;
      j++;
    }
    assert((x+y)== k);
    if(n>0)
    {
   	assert (0<=m); 
	assert (m<n);
    }

}


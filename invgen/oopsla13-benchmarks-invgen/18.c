#include <assert.h>

/*
 * Adapted from ex17.c in NECLA test suite
 */

void main(int flag, int a) {
   int b;
   int j = 0;

   for (b=0; b < 100 ; ++b){
      if (flag)
         j = j +1;
   }


   if(flag)
      assert(j==100);
}

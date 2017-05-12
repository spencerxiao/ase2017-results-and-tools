extern int __VERIFIER_nondet_int();

void main( int flag)
{
   int i, j, k;
   j = 1;
   if(flag) {i=0;}
   else {i=1;}
   

   while(__VERIFIER_nondet_int()) {
      i+=2;
      if(i%2 == 0) {
	j+=2;
      }
      else j++;
   } 
   
   int a = 0;
   int b=0;
   
   while(__VERIFIER_nondet_int()) {
      a++;      
      b+=(j-i); 
   }
   if(flag) {
     if(!(a==b)) {
			 ERROR: goto ERROR;
		 }
	 }
}


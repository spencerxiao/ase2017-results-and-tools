/*
 * InvGen, CAV'09 paper, fig 2
 */

void main(int n) {
  int x= 0;
  while(x<n) {
    x++;
  } 
  if(n>0) {
		if(!(x==n)) {
			ERROR: goto ERROR;
		}
	}
}

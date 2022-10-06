int DIM = 5000;

void fillPrime(int *a){
    int num = 2;
    int pos = 0;
    while(pos < DIM){

        if( divisibile(a, num) == 0){
            a[pos] = num;
            pos++;
        }

        num ++;
    }
}
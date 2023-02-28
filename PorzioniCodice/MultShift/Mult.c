void eseguiMult(int *a, int *b, int* res){

    for(int i = 0; i < N; i++){
        res[i] = a[i] * b[i];
    }

}

void eseguiDiv(int *a, int *b, int* res){

    for (int i = 0; i < N; i++){
      res[i] = a[i] / b[i];
    }

}

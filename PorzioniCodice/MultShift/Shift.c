void eseguiMultShift(int *a, int *b, int *res){

    for (int i = 0; i < N; i++){
      res[i] = a[i] << b[i];
    }

}

void eseguiDivShift(int *a, int *b, int *res){

    for (int i = 0; i < N; i++){
      res[i] = a[i] >> b[i];
    }

}

void subMatrice(int dim, int a[dim][dim], int b[dim][dim])
{
    for (int i = 0; i < dim; i++){
        for (int j = 0; j < dim; j++){
            c[i][j] = a[i][j] - b[i][j];
        }
    }
}
void QuickSort(int v[], int in, int fin){
    if (fin <= in)
        return;
    int pos = partiziona(v, in, fin);

    QuickSort(v, in, pos - 1);
    QuickSort(v, pos + 1, fin);
}

int partiziona(int v[], int in, int fin){

    int i = in + 1, j = fin;
    while (i <= j){
        while ((i <= fin) && (v[i] <= v[in]))
            i++;
        while (v[j] > v[in])
            j--;
        if (i <= j){
            int t = v[i];
            v[i] = v[j];
            v[j] = t;
        }
    }

    int tt = v[in];
    v[in] = v[i - 1];
    v[i - 1] = tt;

    return i - 1;
}

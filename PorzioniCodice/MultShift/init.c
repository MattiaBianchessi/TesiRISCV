#define N 1000

int *generaNumeri()
{
    int *a = malloc(N * sizeof(int));
    for (int i = 0; i < N; i++)
    {
        a[i] = rand();
    }
    return a;
}

int *esponenti(int *a)
{
    int *e = malloc(N * sizeof(int));
    for (int i = 0; i < N; i++)
    {
        e[i] = (int)log2(rand());
    }
    return e;
}
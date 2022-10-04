void bubbleSort(int a[], int dim)
{
    int temp;
    for (int i = 0; i < dim; i++)
    {
        for (int j = 0; j < dim - i - 1; j++)
        {
            if (a[j] > a[j + 1])
            {
                temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
        }
    }
}
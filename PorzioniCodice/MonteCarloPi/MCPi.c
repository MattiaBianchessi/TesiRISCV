double valuePi(int times)
{
    int i, count;
    double x, y, eq, pi;

    for (i = 0; i < times; ++i)
    {
        x = ((double)rand() / RAND_MAX);
        y = ((double)rand() / RAND_MAX);

        eq = x * x + y * y;
        if (eq <= 1)
        {
            count++;
        }
    }

    pi = (long double)4 * (long double)count / (long double)times;
    return pi;
}
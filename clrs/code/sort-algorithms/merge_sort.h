#include <iostream>
#include <vector>
#include <limits>

template< typename T>
void merge( std::vector<T>& list, int p, int q, int r ) {
    
    int n1 = q - p + 1;
    int n2 = r - q;

    std::vector<T> left(n1 + 1);
    std::vector<T> right(n2 + 1);

    for (int i=1; i<=n1; i++ ) {
        left.push_back( list[p+i-1] );
    }

    for (int j=1; j<=n2; j++ ) {
        right.push_back( list[q+j] );
    }

    T INFINITE = std::numeric_limits<T>::max();
    left.push_back(INFINITE);
    right.push_back(INFINITE);

    int i = 1;
    int j = 1;
    for ( int k=p; k<=r ; k++) {

        if ( left[i-1] <= right[j-1] ) {

            list[k] = left[i-1];
            i++;

        } else {

            list[k] = right[j-1];
            j++;

        }

    }

}

template< typename T>
std::vector<T>& merge_sort( std::vector<T>& list, int p, int r) {

    if (p < r) {

        int q = ( p + r ) / 2;

        merge_sort(list, p, q);
        merge_sort(list, q+1, r);
        merge(list,p,q,r);

    }

    return list;

}

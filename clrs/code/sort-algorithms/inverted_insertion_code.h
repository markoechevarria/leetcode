#pragma once
#include <vector>

template <typename T>
std::vector<T> inverted_insertion_sort( std::vector<T> list) {

    for ( int i=1; i<list.size(); i++ ) {

        T key = list[i];
        int j = i - 1;

        while ( j >= 0  && list[j] < key ) {

            list[j+1] = list[j];
            j--;

        }
        list[j+1] = key;

    }

    return list;

}

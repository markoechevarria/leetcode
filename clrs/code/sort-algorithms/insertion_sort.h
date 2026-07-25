#pragma once
#include <concepts>
#include <iostream>
#include <vector>

template <typename T>
concept Numerictype =   std::same_as<T, int> || 
                        std::same_as<T, float> || 
                        std::same_as<T, double>;

template <Numerictype T>
std::vector<T> insertion_sort(std::vector<T> list) {

	for (int j=1; j<list.size(); j++) {
		
		T key = list[j];
		int i = j - 1;

		while ( i > 0 && list[i] > key ) {
			list[i+1] = list[i];
			i--;	
		}

		list[i+1] = key;
			
	}

	return list;

}

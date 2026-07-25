#include <iostream>
#include <vector>
#include "utils/utils.h"
#include "sort-algorithms/insertion_sort.h"
#include "sort-algorithms/inverted_insertion_code.h"
#include "sort-algorithms/merge_sort.h"

int main() {

	std::vector<int> unordered_list = {50,1,2,30,5,1,2,3,5,1,3};
    std::cout << "Unordered list: "; 
    Utils::print_vector(unordered_list);

    std::cout << std::endl;

	// std::vector<int> ordered_list = insertion_sort( unordered_list );
	// std::vector<int> ordered_list = inverted_insertion_sort( unordered_list );
	std::vector<int> ordered_list = merge_sort( unordered_list, 0, unordered_list.size() - 1 );
    std::cout << "Ordered list: ";
    Utils::print_vector(ordered_list);

	return 0;
}



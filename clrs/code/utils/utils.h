#pragma once
#include <vector>
#include <iostream>

namespace Utils {

    template <typename T>

    void print_vector (const std::vector<T>& vec) {

        for (const auto& val: vec) {

            std::cout << val << " ";

        }
    }

}

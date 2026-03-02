#include <iostream>
#include <vector>
#include <unordered_map>

class Solution {
public:
    std::vector<int> findErrorNums(std::vector<int>& nums) {
        std::unordered_map<int, int> hash;
        int first, second;

        for ( int i=1; i<=nums.size(); i++) hash[i]++;

        for ( auto i:nums) hash[i]--;

        for ( auto i: hash) {
            if ( i.second == -1) first = i.first;
            if ( i.second == 1) second = i.first;
        }

        return {first, second};
    }
};

int main() {
    std::vector<int> values = {1,2,3,4,5,6,6,8,9};
    Solution sol;
    std::vector<int> result = sol.findErrorNums( values );
    std::cout << "[" << result[0] << " , " << result[1] << "]" << std::endl;
    return 0;
}

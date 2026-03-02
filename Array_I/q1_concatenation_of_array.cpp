#include <vector>
#include <iostream>

class Solution {
public:
    std::vector<int> getConcatenation(std::vector<int>& nums) {
        std::vector<int> ans;
        for (int i=0; i<2*nums.size() ; i++) {
            ans.push_back( nums[ i%nums.size() ] );
        }
        return ans;
    }

    void printVector(std::vector<int>& nums) {
        for ( int i=0; i < nums.size(); i++ ) {
            std::cout << nums[i] << std::endl;
        }
        std::cout << std::endl;
    }
};

int main(int argc, char *argv[]) {

    std::vector<int> value = {1,2,3,4,5};
   
    Solution sol;
    std::vector<int> response = sol.getConcatenation(value);
    sol.printVector(value); 
    sol.printVector(response); 
    return 0;
}

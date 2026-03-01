#include <vector>
#include <iostream>

class Solution {
public:
    std::vector<int> shuffle(std::vector<int>& nums, int n) {
        std::vector<int> ans;
        for (int i=0; i < n; i++) {
            ans.push_back( nums[i] );
            ans.push_back( nums[n+i]);
        }
        return ans;
    }
    
    void print(std::vector<int>& nums) {
        for (int i=0; i<nums.size(); i++) {
            std::cout<< nums[i] << std::endl;
        }
        std::cout << std::endl;
    }
};

int main(int argv, char *argc[]) {
    std::vector<int> value = {1,2,3,4,5,6,7,8};
    Solution sol;
    std::vector<int> response = sol.shuffle(value, value.size()/2);
    sol.print(response); 
    return 0;
}

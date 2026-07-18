#include <vector>

class Solution {
public:
    std::vector<int> smallerNumbersThanCurrent(std::vector<int>& nums) {
        /*
        vector<int> ans(nums.size(), 0);

        for (int a=0; a<nums.size(); a++) {
            for (auto b: nums) {
                if ( b < nums[a] ) { ans[a]++; } 
            }
        }
        return ans;
        */

        int max=0;
        for (int a: nums) if ( a > max) max = a;
        
        std::vector<int> counting(max+1, 0);
        for (int a: nums) counting[a]++;
        for (int a=1; a<max+1; a++) counting[a] = counting[a] + counting[a-1];

        std::vector<int> ans;
        for (int a: nums) a==0? ans.push_back(0) : ans.push_back( counting[a-1] );

        return ans;
    }    
};

int main(int argc, char *argv[] ) {
    std::vector<int> value = {5,0,10,0,10,6};
    Solution sol;
    sol.smallerNumbersThanCurrent(value);
}

#include <vector>

class Solution {
public:
    int findMaxConsecutiveOnes(std::vector<int>& nums) {
        int max = 0;
        int counter = 0;
        for (int i = 0; i < nums.size(); i++) {
            nums[i] == 1 ? counter++ : counter=0;
            if ( counter > max) { max = counter; }
        }
        return max;
    }
};

int main(int argv, char *argc[]) {
    std::vector<int> value = {1,1,1,0,0,0,1,1,0,1,0,1,1,0};

    Solution sol;
    sol.findMaxConsecutiveOnes(value);
}

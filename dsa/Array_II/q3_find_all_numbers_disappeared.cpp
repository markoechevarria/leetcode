#include <vector>
#include <map>

class Solution {
public:
    std::vector<int> findDisappearedNumbers(std::vector<int>& nums) {

        // first attempt
        int max = 0;
        for (int a: nums) max++;

        std::vector<int> counting(max, 0);
        for (int a: nums) counting[a-1]++;

        std::vector<int> ans;
        for (int i=0; i<counting.size(); i++) if (counting[i]==0) ans.push_back(i+1);

        return ans; 

        /*
        second attempt
        std::map<int, int> hash;
        std::vector<int> ans;

        for (int i=1; i<nums.size()+1; i++) hash[i]=0;
        for (int i=0; i<nums.size(); i++) hash[nums[i]]++;
        for (auto a: hash) if ( a.second == 0 ) ans.push_back(a.first);

        return ans;
        */

        /*
        third attempt 
        unordered_map<int, int> hash;
        
        int n=0;
        vector<int> ans;
        for (int a: nums) n++;

        for (auto a: nums) hash[a]++;

        for (int i=0; i<nums.size(); i++) {
            if ( hash.find(i+1) == hash.end() ) ans.push_back(i+1);
        }


        return ans;
        */
    }
};

int main(int argc, char *argv[]) {

    std::vector<int> value = {4,3,2,7,8,2,3,1};
    Solution sol;
    sol.findDisappearedNumbers(value);
    return 0;
}

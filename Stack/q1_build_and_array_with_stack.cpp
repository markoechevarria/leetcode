#include <iostream>
#include <vector>
#include <string>

class Solution {
public:
    std::vector<std::string> buildArray(std::vector<int>& target, int n) {
        std::vector<int> ans;
        std::vector<std::string> resp;
        int a=1;
        for (int i=0, a=0; i<n && target!=ans; i++, a++) {
            ans.push_back(i+1);
            resp.push_back("Push");

            if ( ans[ans.size()-1] != target[a-1] ) {
                ans.pop_back();
                resp.push_back("Pop");
                a--;
            }
        }
        return resp;
    }
};

int main(int argc, char *argv[]) {
    std::vector<int> value = {1, 2};
    Solution sol;
    sol.buildArray(value, 4);
}

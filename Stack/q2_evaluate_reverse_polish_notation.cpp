#include <iostream>
#include <vector>
#include <stack>
#include <string>
#include <algorithm>
#include <cctype>

class Solution {
public:
    int evalRPN(std::vector<std::string>& tokens) {
        std::stack<long> stck;

        for (const std::string& token: tokens) {
            if (token.size() > 1 || isdigit(token[0])) {
                stck.push(stoi(token));
            } else {
                int right = stck.top(); stck.pop();
                int left = stck.top(); stck.pop();

                if ( token == "+") { stck.push(left + right); }
                if ( token == "-") { stck.push(left - right); }
                if ( token == "*") { stck.push(left * right); }
                if ( token == "/") { stck.push(left / right); }
            }
        }

        return stck.top();
    }
};

int main( int argc, char *argv[]) {
    std::vector<std::string> value = {"4","13","5","/","+"};
    Solution sol;
    sol.evalRPN( value );
}

#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

class Solution {
public:
    int evalRPN(std::vector<std::string>& tokens) {
        std::string last = tokens[tokens.size() - 1];
        tokens.pop_back();

        if ( !last.empty() && std::all_of(last.begin(), last.end(), ::isdigit) ) { return std::stoi(last); }
        
        if ( last == "+") return evalRPN(tokens) + evalRPN(tokens);
        if ( last == "-") return evalRPN(tokens) - evalRPN(tokens);
        if ( last == "*") return evalRPN(tokens) * evalRPN(tokens);
        if ( last == "/") return evalRPN(tokens) / evalRPN(tokens);

        return 0;
    }
};

int main( int argc, char *argv[]) {
    std::vector<std::string> value = {"4","13","5","/","+"};
    Solution sol;
    sol.evalRPN( value );
}

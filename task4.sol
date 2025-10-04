// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RomanToIntConverter {
    // 修复函数签名，将参数类型改为string
    function romanToInt(string memory roman) public pure returns (uint) {
        uint result = 0;
        uint prevValue = 0;
        
        // 获取字符串长度
        uint len = bytes(roman).length;
        
        // 从右向左遍历罗马数字
        for (uint i = len; i > 0; i--) {
            // 获取当前字符
            bytes1 char = bytes(roman)[i-1];
            uint currValue = 0;
            
            // 根据字符获取对应的值
            if (char == 'I') currValue = 1;
            else if (char == 'V') currValue = 5;
            else if (char == 'X') currValue = 10;
            else if (char == 'L') currValue = 50;
            else if (char == 'C') currValue = 100;
            else if (char == 'D') currValue = 500;
            else if (char == 'M') currValue = 1000;
            
            // 应用罗马数字的减法规则
            if (currValue < prevValue) {
                result -= currValue;
            } else {
                result += currValue;
            }
            
            // 更新前一个值
            prevValue = currValue;
        }
        
        return result;
    }
}
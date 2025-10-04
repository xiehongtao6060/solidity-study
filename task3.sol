// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract IntToRomanConverter {
    // 将整数转换为罗马数字
    // 修改前
    // function intToRoman(uint num) public pure returns (string memory) {
    
    // 修改后
    function intToRoman(uint num) public pure returns (string memory) {
        // 输入验证 - 罗马数字通常表示范围是1-3999
        require(num > 0 && num < 4000, "Input must be between 1 and 3999");
        
        // 预定义所有可能的值和对应的符号
        // 按从大到小排序，包含所有特殊的减法组合
        // 修改前
        // uint256[] memory values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
        
        // 修改后
        // 这是最简洁的解决方案
        uint16[13] memory values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
        string[13] memory symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
        
        // 结果字符串
        string memory result = "";
        
        // 贪心算法核心逻辑
        for (uint i = 0; i < values.length; i++) {
            // 当当前数值大于等于当前值时，重复添加对应符号
            while (num >= values[i]) {
                result = string(abi.encodePacked(result, symbols[i]));
                num -= values[i];
            }
        }
        
        return result;
    }
}
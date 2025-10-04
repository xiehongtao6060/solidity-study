// SPDX-License-Identifier: MIT

//  反转字符串 (Reverse String)
// 题目描述：反转一个字符串。输入 "abcde"，输出 "edcba"

pragma solidity ^0.8.0;

contract ReverseS{
    function reverseString(string memory str)public pure returns (string memory){
        bytes memory bytesStr = bytes(str);
        uint256 len = bytesStr.length;
        for (uint256 i = 0; i < len / 2; i++){
            (bytesStr[i], bytesStr[len - 1 - i]) = (bytesStr[len - 1 - i], bytesStr[i]);
        }
        return string(bytesStr);
    }
}
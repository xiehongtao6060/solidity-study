// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BinarySearch {
    // 二分查找函数
    // 输入：有序数组和目标值
    // 输出：如果找到目标值，返回其索引；否则返回-1（在Solidity中用type(uint).max表示未找到）
    // 优化版本的中间值计算
    function binarySearch(uint[] memory arr, uint target) public pure returns (uint) {
        if (arr.length == 0) {
            return type(uint).max;
        }
        
        uint left = 0;
        uint right = arr.length - 1;
        
        while (left < right) { // 注意这里改为了left < right
            uint mid = left + (right - left) / 2;
            
            if (arr[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        
        // 最后检查left位置的值是否等于目标值
        return (arr[left] == target) ? left : type(uint).max;
    }
}
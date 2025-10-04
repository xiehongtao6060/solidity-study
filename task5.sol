// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MergeSortedArrays {
    // 合并两个有序数组的函数
    function merge(uint[] memory nums1, uint[] memory nums2) public pure returns (uint[] memory) {
        // 获取两个数组的长度
        uint m = nums1.length;
        uint n = nums2.length;
        
        // 创建结果数组，长度为两个数组长度之和
        uint[] memory result = new uint[](m + n);
        
        // 初始化三个指针
        uint i = 0; // 指向nums1的当前位置
        uint j = 0; // 指向nums2的当前位置
        uint k = 0; // 指向result的当前位置
        
        // 当两个数组都有元素时，比较并合并
        while (i < m && j < n) {
            if (nums1[i] <= nums2[j]) {
                result[k] = nums1[i];
                i++;
            } else {
                result[k] = nums2[j];
                j++;
            }
            k++;
        }
        
        // 处理nums1中剩余的元素
        while (i < m) {
            result[k] = nums1[i];
            i++;
            k++;
        }
        
        // 处理nums2中剩余的元素
        while (j < n) {
            result[k] = nums2[j];
            j++;
            k++;
        }
        
        return result;
    }
}
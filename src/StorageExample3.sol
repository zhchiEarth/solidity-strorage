// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StorageExample3 {
    string a = unicode"我比较短"; // 0号插槽，一个汉字 3字节， 3 *4 * 8= 96
    //  19 * 3 = 57 超过了一个插槽的长度，需要用2个 插槽来存储.
    // 插槽 1 存储了 字符串的长度
    // 字符串的存储起始位置 start = keccak256(1) = 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6
    // 字符串的下一个位置 keccak256(1) + 1 = 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf7
    string b = unicode"我特别特别长，已经超过了一个插槽存储量";
}

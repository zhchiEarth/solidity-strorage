// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StorageExample {
    uint8 public a = 10; // 插槽0号位置
    uint8 public a1 = 11; // 插槽0号位置
    uint256 b = 12; // 插槽1
    uint256[2] c = [13, 14]; // 插槽2，3
    struct Entry {
        uint256 id;
        uint256 value;
    }
    Entry d; // 插槽4，5
}

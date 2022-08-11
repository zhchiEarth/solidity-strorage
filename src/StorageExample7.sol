// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StorageExample7 {
    uint8 public a = 10; // 插槽0号位置
    uint8 public a1 = 11; // 插槽0号位置
    uint256 b = 12; // 插槽1
    uint256 public constant MAX = 65536;
    uint256 public immutable d; //智能在contrast

    constructor() {
        d = 256;
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract A {
    uint256 aa = 110;
    uint8 ab = 111;
}

contract B is A {
    uint8 ba = 255;
}

contract D {
    uint16 d = 999;
}

contract C is D {
    uint16 c = 1000;
}

contract StorageExample8 is B, C {
    uint8 public a = 10; // 插槽0号位置
    uint8 public a1 = 11; // 插槽0号位置
    uint256 b = 12; // 插槽1
}

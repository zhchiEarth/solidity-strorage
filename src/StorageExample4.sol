// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract StorageExample4 {
    // 插槽0 存储长度
    // 数组a的成员，16位 * 5 ，不超过256 ，所以存储在一个插槽
    // 数组a值：keccak256(0) = 0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563
    uint16[] public a = [401, 402, 403, 405, 406];

    // 插槽1 b 存储长度
    // 数组b的成员，每一个都占256位，每一个单独占一个插槽
    // b[0] = keccak256(1) = 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6
    // b[1] = keccak256(1) + 1 = 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf7
    // b[2] = keccak256(1) + 2 = 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf8
    // b[3] = keccak256(1) + 3 = 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf9
    // b[4] = keccak256(1) + 4 = 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cfa
    uint256[] public b = [401, 402, 403, 405, 406];
}

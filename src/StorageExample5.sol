// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StorageExample5 {
    mapping(string => uint256) a; // mapping 不存储长度

    constructor() public {
        a["u1"] = 18; // 插槽位置 keccak256("u1",0)
        a["u2"] = 19; // 插槽位置 keccak256("u2",0)
    }
}

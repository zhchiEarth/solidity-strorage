// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/StorageExample8.sol";
import "forge-std/console2.sol";

contract StorageExample8Test is Test {
    using stdStorage for StdStorage;

    StorageExample8 private example;

    function setUp() public {
        // vm.record();
        example = new StorageExample8();
    }

    function testExample() public {
        // (bytes32[] memory reads, bytes32[] memory writes) = vm.accesses(
        //     address(example)
        // );

        // for (uint256 i = 0; i < reads.length; i++) {
        //     console2.logBytes32(reads[i]);
        // }

        // for (uint256 i = 0; i < writes.length; i++) {
        //     console2.logBytes32(writes[i]);
        // }

        uint256 value = uint256(vm.load(address(example), bytes32(0)));
        console2.log("contract A aa value:", value);

        uint256 solt1 = 1;
        uint256 value1 = uint256(vm.load(address(example), bytes32(solt1)));
        console2.log("contract A ab value:", uint8(value1));

        // 合约B的值 ba的值
        console2.log("contract B ba value:", uint8(value1 >> 8));

        // 合约D  ba 的值值
        console2.log("contract D d value:", uint16(value1 >> 16));

        // 合约C  ba 的值值
        console2.log("contract C c value:", uint16(value1 >> 32));

        // 合约A  a 的值值
        console2.log("contract A a value:", uint8(value1 >> 48));

        // 合约A a1 的值
        console2.log("contract A a1 value:", uint8(value1 >> 56));

        uint256 solt2 = 2;
        uint256 value2 = uint256(vm.load(address(example), bytes32(solt2)));
        console2.log("contract A b value:", value2);
    }
}

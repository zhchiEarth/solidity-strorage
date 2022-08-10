// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/StorageExample.sol";
import "forge-std/console2.sol";

contract StorageExampleTest is Test {
    using stdStorage for StdStorage;

    StorageExample private example;

    function setUp() public {
        // vm.record();
        example = new StorageExample();
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
        uint8 v1 = uint8(value);
        // 右移 8位 得到 a1
        uint256 v2 = (value >> 8);
        console2.log("a:", v1);
        console2.log("a1", v2);
        uint256 solt1 = 1;
        uint256 value1 = uint256(vm.load(address(example), bytes32(solt1)));
        console2.log("b:", value1);

        uint256 solt2 = 2;
        uint256 value2 = uint256(vm.load(address(example), bytes32(solt2)));
        console2.log("c[0]:", value2);

        uint256 solt3 = 3;
        uint256 value3 = uint256(vm.load(address(example), bytes32(solt3)));
        console2.log("c[1]:", value3);

        uint256 solt4 = 4;
        uint256 value4 = uint256(vm.load(address(example), bytes32(solt4)));
        console2.log("Entry-id:", value4);

        uint256 solt5 = 5;
        uint256 value5 = uint256(vm.load(address(example), bytes32(solt5)));
        console2.log("Entry-value:", value5);
    }
}

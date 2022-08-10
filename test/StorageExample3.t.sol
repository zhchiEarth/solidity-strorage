// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/StorageExample3.sol";
import "forge-std/console2.sol";

contract StorageExample3Test is Test {
    using stdStorage for StdStorage;

    StorageExample3 private example;

    function setUp() public {
        // vm.record();
        example = new StorageExample3();
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

        uint256 solt0 = 0;
        bytes32 value = vm.load(address(example), bytes32(solt0));
        string memory str = string(bytes.concat(value));
        console2.log(str); // 插槽 0 a的值

        uint256 solt1 = 1;
        uint256 value1 = uint256(vm.load(address(example), bytes32(solt1)));
        console2.log("b length:", value1);

        bytes32 solt_b_0 = keccak256(abi.encodePacked(solt1));
        bytes32 solt_b_1 = bytes32(uint256(solt_b_0) + 1);

        bytes32 b_0 = bytes32(
            uint256(vm.load(address(example), bytes32(solt_b_0)))
        );
        bytes32 b_1 = bytes32(
            uint256(vm.load(address(example), bytes32(solt_b_1)))
        );

        bytes memory b_value = bytes.concat(b_0, b_1);
        console2.logBytes(b_value);
        // string memory b_str = string(b_value);
        console2.log(string(b_value));
        // console2.log(example._toString(b_value));
    }
}

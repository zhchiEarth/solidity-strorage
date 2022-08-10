// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/StorageExample4.sol";
import "forge-std/console2.sol";

contract StorageExample4Test is Test {
    using stdStorage for StdStorage;

    StorageExample4 private example;

    function setUp() public {
        example = new StorageExample4();
    }

    function testExample() public {
        uint256 solt0 = 0;
        uint256 value = uint256(vm.load(address(example), bytes32(solt0)));
        console2.log("array a length:", value); // 插槽 0 a的值
        bytes32 arr_a_solt = keccak256(abi.encodePacked(solt0));

        uint256 arr_a = uint256(vm.load(address(example), arr_a_solt));
        uint16 arr_a_0 = uint16(arr_a);
        uint16 arr_a_1 = uint16(arr_a >> 16);
        uint16 arr_a_2 = uint16(arr_a >> 32);
        uint16 arr_a_3 = uint16(arr_a >> 48);
        uint16 arr_a_4 = uint16(arr_a >> 64);

        console2.log("arr_a_0:", arr_a_0);
        console2.log("arr_a_1:", arr_a_1);
        console2.log("arr_a_2:", arr_a_2);
        console2.log("arr_a_3:", arr_a_3);
        console2.log("arr_a_4:", arr_a_4);

        uint256 solt1 = 1;
        uint256 value1 = uint256(vm.load(address(example), bytes32(solt1)));
        console2.log("array b length:", value1);

        bytes32 arr_b_solt0 = keccak256(abi.encodePacked(solt1));
        bytes32 arr_b_solt1 = bytes32(uint256(arr_b_solt0) + 1);
        bytes32 arr_b_solt2 = bytes32(uint256(arr_b_solt0) + 2);
        bytes32 arr_b_solt3 = bytes32(uint256(arr_b_solt0) + 3);
        bytes32 arr_b_solt4 = bytes32(uint256(arr_b_solt0) + 4);

        uint256 arr_b_k0_value = uint256(
            vm.load(address(example), bytes32(arr_b_solt0))
        );
        console2.log("array b index 0 value:", arr_b_k0_value);

        uint256 arr_b_k1_value = uint256(
            vm.load(address(example), bytes32(arr_b_solt1))
        );
        console2.log("array b index 1 value:", arr_b_k1_value);

        uint256 arr_b_k2_value = uint256(
            vm.load(address(example), bytes32(arr_b_solt2))
        );
        console2.log("array b index 2 value:", arr_b_k2_value);

        uint256 arr_b_k3_value = uint256(
            vm.load(address(example), bytes32(arr_b_solt3))
        );
        console2.log("array b index 3 value:", arr_b_k3_value);

        uint256 arr_b_k4_value = uint256(
            vm.load(address(example), bytes32(arr_b_solt4))
        );
        console2.log("array b index 4 value:", arr_b_k4_value);
    }
}

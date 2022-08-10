// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/StorageExample5.sol";
import "forge-std/console2.sol";

contract StorageExample5Test is Test {
    using stdStorage for StdStorage;

    StorageExample5 private example;

    function setUp() public {
        // vm.record();
        example = new StorageExample5();
    }

    function testExample() public {
        uint256 slot = 0;
        uint256 v = uint256(vm.load(address(example), bytes32(slot)));
        console2.log("slot 0 value :", v); // 插槽 0 a的值

        uint256 value = uint256(
            vm.load(
                address(example),
                bytes32(keccak256(abi.encodePacked("u1", slot)))
            )
        );
        console2.log("mapping key u1 vaslue :", value); // 插槽 0 a的值

        uint256 value1 = uint256(
            vm.load(
                address(example),
                bytes32(keccak256(abi.encodePacked("u2", slot)))
            )
        );
        console2.log("mapping key u2 vaslue :", value1); // 插槽 0 a的值
    }
}

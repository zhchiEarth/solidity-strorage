// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/StorageExample2.sol";
import "forge-std/console2.sol";

contract StorageExample2Test is Test {
    using stdStorage for StdStorage;

    StorageExample2 private example;

    function setUp() public {
        example = new StorageExample2();
    }

    function testExample() public {
        uint256 solt0 = 0;
        uint256 value = uint256(vm.load(address(example), bytes32(solt0)));
        console2.log("a:", value); // 插槽 0 a的值

        uint256 solt1 = 1;
        uint256 value1 = uint256(vm.load(address(example), bytes32(solt1)));
        uint8 b = uint8(value1); // 占 8位
        uint128 c = uint128(value1 >> 8); //因为 b占8位，所以向右移8位得到 c的值
        uint8 d8 = uint8(value1 >> 136);
        bool d;
        // 将uint8 转成 bool
        assembly {
            d := d8
        }
        console2.log("b:", b);
        console2.log("c:", c);
        console2.log("d:", d);

        uint256 solt2 = 2;
        uint256 value2 = uint256(vm.load(address(example), bytes32(solt2)));
        console2.log("e:", value2);
    }
}

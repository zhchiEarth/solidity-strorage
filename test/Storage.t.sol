// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/Storage.sol";
import "forge-std/console2.sol";

contract TestContract is Test {
    using stdStorage for StdStorage;

    Storage test;

    function setUp() public {
        test = new Storage();
    }

    function testFindExists() public {
        // Lets say we want to find the slot for the public
        // variable `exists`. We just pass in the function selector
        // to the `find` command
        // uint256 slot = stdstore.target(address(test)).sig("exists()").find();
        // 获取槽的值
        uint256 value = uint256(vm.load(address(test), bytes32(0)));
        assertEq(value, 1);

        (bytes32[] memory reads, bytes32[] memory writes) = vm.accesses(
            address(test)
        );

        for (uint256 i = 0; i < reads.length; i++) {
            console2.logBytes32(reads[i]);
        }

        for (uint256 i = 0; i < writes.length; i++) {
            console2.logBytes32(writes[i]);
        }
    }

    function testWriteExists() public {
        // Lets say we want to write to the slot for the public
        // variable `exists`. We just pass in the function selector
        // to the `checked_write` command
        // stdstore.target(address(test)).sig("exists()").checked_write(100);

        // 把槽 0 的值改成100
        uint256 slot = 0;
        uint256 value = 100;
        vm.store(address(test), bytes32(slot), bytes32(value));

        uint256 v = uint256(vm.load(address(test), bytes32(slot)));
        console.log("slot", v);
        assertEq(v, 100);
    }

    // It supports arbitrary storage layouts, like assembly based storage locations
    function testFindHidden() public {
        // `hidden` is a random hash of a bytes, iteration through slots would
        // not find it. Our mechanism does
        // Also, you can use the selector instead of a string
        uint256 slot = stdstore
            .target(address(test))
            .sig(test.hidden.selector)
            .find();
        assertEq(slot, uint256(keccak256("my.random.var")));
    }

    // If targeting a mapping, you have to pass in the keys necessary to perform the find
    // i.e.:
    function testFindMapping() public {
        uint256 slot = stdstore
            .target(address(test))
            .sig(test.map_addr.selector)
            .with_key(address(this))
            .find();
        // in the `Storage` constructor, we wrote that this address' value was 1 in the map
        // so when we load the slot, we expect it to be 1
        assertEq(uint256(vm.load(address(test), bytes32(slot))), 1);
    }

    // If the target is a struct, you can specify the field depth:
    function testFindStruct() public {
        // NOTE: see the depth parameter - 0 means 0th field, 1 means 1st field, etc.
        uint256 slot_for_a_field = stdstore
            .target(address(test))
            .sig(test.basicStruct.selector)
            .depth(0)
            .find();

        uint256 slot_for_b_field = stdstore
            .target(address(test))
            .sig(test.basicStruct.selector)
            .depth(1)
            .find();

        assertEq(uint256(vm.load(address(test), bytes32(slot_for_a_field))), 1);
        assertEq(uint256(vm.load(address(test), bytes32(slot_for_b_field))), 2);
    }
}

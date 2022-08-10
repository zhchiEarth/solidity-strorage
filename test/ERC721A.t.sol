// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/ERC721A.sol";
import "forge-std/console2.sol";

contract ERC721ATest is Test {
    using stdStorage for StdStorage;

    ERC721A private erc721a;

    function setUp() public {
        erc721a = new ERC721A("ERC721A", "ERC721A");
    }

    function testNumberBurned() public view {
        uint256 _BITPOS_NUMBER_BURNED = 128;
        uint256 _BITMASK_ADDRESS_DATA_ENTRY = (1 << 64) - 1;
        uint256 v = 36893488147419103234;
        uint256 v1 = v >> _BITPOS_NUMBER_BURNED;
        uint256 v2 = v1 & _BITMASK_ADDRESS_DATA_ENTRY;
        console2.log(v1);
        console2.log(v2);
    }

    function testMint() public view {
        // Bits Layout:
        // - [0..63]    `balance`
        // - [64..127]  `numberMinted`
        // - [128..191] `numberBurned`
        // - [192..255] `aux`
        // mapping(address => uint256) public _packedAddressData;
        // _BITPOS_NUMBER_MINTED = 64
        console2.log(1 << 64);
        console2.log((1 << 64) | 1);
        console2.log(2 * ((1 << 64) | 1));
        console2.log((2 * ((1 << 64) | 1)) / 2);
    }

    function testNumberMinted() public view {
        uint256 v = 2 * ((1 << 64) | 1);
        uint256 _BITMASK_ADDRESS_DATA_ENTRY = (1 << 64) - 1;
        console2.log((v >> 64));
        console2.log((v >> 64) & _BITMASK_ADDRESS_DATA_ENTRY);
    }
}

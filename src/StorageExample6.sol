// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StorageExample6 {
    uint256 a = 11; // 插槽 0
    uint8 b = 12; // 插槽1
    uint128 c = 13; // 插槽1
    bool d = true; // 插槽1
    uint128 e = 14; // 插槽2
    uint256[] public array = [401, 402, 403, 405, 406]; // 数组长度 插槽3
    // array[0] = keccak256(3) =
    // array[1] = keccak256(3) + 1 =

    address owner; //数组长度 插槽4
    mapping(address => UserInfo) public users; //为空 插槽5
    // users 的值 = keccak256(key,"5")
    string str = "name value"; // 插槽6的值：当str小于等于31字节，为str的值，当 大于31字节，str的长度

    struct UserInfo {
        // string的规则：
        // 1. 当name小于等于31字节，这里是为name的值，
        // 当 大于31字节，这里是name的长度，name的 值 就是在
        string name;
        // age, weigth 占用一个插槽
        uint8 age;
        uint8 weight;
        // 数组的规则，数组的长度

        uint256[] orders;
        uint64[3] lastLogins;
    }

    constructor() public {
        owner = msg.sender;

        addUser(owner, "admin", 17, 120);
    }

    function addUser(
        address user,
        string memory name,
        uint8 age,
        uint8 weight
    ) public {
        require(age > 0 && age < 100, "bad age");

        uint256[] memory orders;
        uint64[3] memory logins;

        users[user] = UserInfo({
            name: name,
            age: age,
            weight: weight,
            orders: orders,
            lastLogins: logins
        });
    }

    function addLog(
        address user,
        uint64 id1,
        uint64 id2,
        uint64 id3
    ) public {
        UserInfo storage u = users[user];
        assert(u.age > 0);

        u.lastLogins[0] = id1;
        u.lastLogins[1] = id2;
        u.lastLogins[2] = id3;
    }

    function addOrder(address user, uint256 orderID) public {
        UserInfo storage u = users[user];
        assert(u.age > 0);
        u.orders.push(orderID);
    }

    function getLogins(address user)
        public
        view
        returns (
            uint64,
            uint64,
            uint64
        )
    {
        UserInfo storage u = users[user];
        return (u.lastLogins[0], u.lastLogins[1], u.lastLogins[2]);
    }

    function getOrders(address user) public view returns (uint256[] memory) {
        UserInfo storage u = users[user];
        return u.orders;
    }
}

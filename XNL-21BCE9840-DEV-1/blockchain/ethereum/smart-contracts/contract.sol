// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DevOpsCertificate {
    address public owner;
    mapping(address => bool) public certified;

    event Certified(address indexed user);

    constructor() {
        owner = msg.sender;
    }

    function certify(address user) public {
        require(msg.sender == owner, "Only owner can certify.");
        certified[user] = true;
        emit Certified(user);
    }

    function isCertified(address user) public view returns (bool) {
        return certified[user];
    }
}

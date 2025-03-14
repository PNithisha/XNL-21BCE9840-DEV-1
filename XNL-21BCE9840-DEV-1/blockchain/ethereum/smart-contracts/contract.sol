pragma solidity ^0.8.0;

contract CICDValidation {
    event CodeValidated(address indexed validator, string commitHash);

    function validateCode(string memory commitHash) public {
        emit CodeValidated(msg.sender, commitHash);
    }
}

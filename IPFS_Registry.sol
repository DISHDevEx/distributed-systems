// SPDX-License-Identifier: MIT
pragma solidity ^0.6.11;


// 0x8c700A5F78d61E350E7bd7d85A6e688bbBB8A7AF

contract IpfsStorage {
    mapping (address => string) public userFiles;

    function setFile(string memory file) external {
        userFiles[msg.sender] = file;
    }
}
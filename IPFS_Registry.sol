// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

contract IPFS_Registry {

    //Deployed Contract: 0xf5C5A7429fb1716ED9c112b1537416D03737D0C9

    // Mapping from content id to content struct
    mapping(address => string) public contents;

    function setFilePublic(string memory file) public {
        contents[msg.sender] = file;
    }

    function setFileExternal(string memory file) external {
        contents[msg.sender] = file;
    }

}
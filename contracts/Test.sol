//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./JSON.sol";

contract Test {
    function generate(string memory name, string memory vibe, uint256 phase) pure public returns (string memory) {
        JSON.JSONData memory attributes;
        attributes = JSON.addString(attributes, "strength", "extreme");
        attributes = JSON.addString(attributes, "dog", "an absolute maniac");
        
        JSON.JSONData memory data;
        data = JSON.addString(data, "name", name);
        data = JSON.addString(data, "vibe", vibe);
        data = JSON.addNumber(data, "phase", phase);
        data = JSON.addBool(data, "gm", true);
        data = JSON.addSubobject(data, "attributes", attributes);
        return JSON.serialize(data);
    }
}

//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./JSON.sol";

contract Test {
    using JSON for JSON.JSONData;
    
    function generate(string memory name, string memory vibe, uint256 phase) pure public returns (string memory) {
        JSON.JSONData memory attributes;
        attributes = attributes.addString("strength", "extreme");
        attributes = attributes.addString("dog", "an absolute maniac");
        
        JSON.JSONData memory data;
        data = data.addString("name", name);
        data = data.addString("vibe", vibe);
        data = data.addNumber("phase", phase);
        data = data.addBool("gm", true);
        data = data.addSubobject("attributes", attributes);
        return data.serialize();
    }
}

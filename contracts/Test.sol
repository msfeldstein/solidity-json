//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./JSON.sol";

contract Test {
    function generate(string memory name, string memory vibe, uint256 phase) pure public returns (string memory) {
        JSON.JSONData memory data;
        data = JSON.addString(data, "name", name);
        data = JSON.addString(data, "vibe", vibe);
        data = JSON.addNumber(data, "phase", phase);
        data = JSON.addBool(data, "gm", true);
        return JSON.serialize(data);
    }
}

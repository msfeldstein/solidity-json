//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/// @title JSON Builder
/// @author Michael Feldstein
/// @notice Use this to help generate single-level json strings
library JSON {
    struct JSONData {
        // We have to give a static sized array, dynamic arrays give solidity heartburn
        string[20] stringKeys;
        string[20] stringValues;
        uint256 numStrings;
        string[20] numberKeys;
        uint256[20] numberValues;
        uint256 numNumbers;
    }

    function addString(
        JSONData memory data,
        string memory key,
        string memory value
    ) public pure returns (JSONData memory) {
        data.stringKeys[data.numStrings] = key;
        data.stringValues[data.numStrings] = value;
        data.numStrings++;
        return data;
    }

    function addNumber(
        JSONData memory data,
        string memory key,
        uint256 value
    ) public pure returns (JSONData memory){
        data.numberKeys[data.numNumbers] = key;
        data.numberValues[data.numNumbers] = value;
        data.numNumbers++;
        return data;
    }

    function serialize(JSONData memory data)
        public
        pure
        returns (string memory)
    {
        bool hasNumbers = data.numNumbers > 0;
        bytes memory json = "{";
        for (uint256 i = 0; i < data.numStrings; i++) {
            json = abi.encodePacked(
                json,
                '"',
                data.stringKeys[i],
                '": "',
                data.stringValues[i],
                '"'
            );
            if (i < data.numStrings - 1 || hasNumbers) {
                json = abi.encodePacked(json, ", ");
            }
        }

        for (uint256 i = 0; i < data.numNumbers; i++) {
            json = abi.encodePacked(
                json,
                '"',
                data.numberKeys[i],
                '": ',
                uint2str(data.numberValues[i])
            );
            if (i < data.numNumbers - 1) {
                json = abi.encodePacked(json, ", ");
            }
        }
        json = abi.encodePacked(json, "}");
        return string(json);
    }

    function uint2str(uint256 _i)
        internal
        pure
        returns (string memory _uintAsString)
    {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - (_i / 10) * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}

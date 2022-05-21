// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./NftFamily.sol";

contract Kidnft is NftFamily { 

    struct Kid {
         uint8 Age;
         uint8 Level;
         string Name;
         string LastName;        
    }

    Kid [] kidArray;

    // Generate Kid Nft
    function generateNftKid ( uint8 _age ,string memory _name , uint8 familyId) public {
        kidArray.push(Kid(_age,_familyTokens[familyId].Level,_name,_familyTokens[familyId].LastName));
    }

    // Show Kid Nft
    function showKid() public view returns (Kid [] memory) {
        return kidArray;
    }


}
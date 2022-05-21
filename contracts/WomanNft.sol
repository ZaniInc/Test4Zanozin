// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./ManNft.sol";

contract WomanNft is ManNft  { 

     struct Woman {
         uint8 Age;
         uint8 Level;
         string Name;
         string LastName;        
    }

    Woman [] womanNft;

    // Generate Nft Man
    function generateNftWoman (uint8 age , uint8 level , string memory _name , string memory lastname ) public returns(bool) {
        womanNft.push(Woman(age,level,_name,lastname));
        return true;
    }

    // Show Woman Nft
    function showWoman() public view returns (Woman [] memory) {
        return womanNft ;
    }


}
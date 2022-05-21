// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ManNft is ERC721 { 

    constructor () ERC721( "ManNFT" , "MFT") {}

     struct Man {
         uint8 Age;
         uint8 Level;
         string Name;
         string LastName;        
    }

    Man [] manNft;

    // Generate Nft Man
    function generateNftMan (uint8 age , uint8 level , string memory _name , string memory lastname ) public returns(bool) {
        manNft.push(Man(age,level,_name,lastname));
        return true;
    }

    // Show Man nft token
    function showMan() public view returns (Man [] memory) {
        return manNft ;
    }

}
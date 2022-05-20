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

    Man [] family;

    function generateNft (uint8 age , uint8 level , string memory name , string memory lastname) public returns(Man memory) {

    }

}
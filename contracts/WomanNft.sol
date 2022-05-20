// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract WomanNft is ERC721  { 

    constructor () ERC721( "WomanNFT" , "WFT") {}

     struct Woman {
         uint8 Age;
         uint8 Level;
         string Name;
         string LastName;        
    }


}
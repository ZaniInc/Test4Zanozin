// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

interface famNFT {

    function getFamilyLevel () external view returns (uint8);
    function getFamilyLastname () external view returns (string memory);
}

contract Kidnft is ERC721 { 

    constructor () ERC721( "KIDNFT" , "KFT") {}

    struct Kid {
         uint8 Age;
         uint8 Level;
         string Name;
         string LastName;        
    }

    Kid [] kidArray;

    // Generate Kid Nft
    function generateNftKid ( uint8 _age ,string memory _name  , famNFT nft ) public {
        kidArray.push(Kid(_age,nft.getFamilyLevel(),_name,nft.getFamilyLastname()));
    }

    // Show Kid Nft
    function showKid() public view returns (Kid [] memory) {
        return kidArray;
    }


}
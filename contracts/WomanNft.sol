// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract WomanNft is ERC721 {

    constructor () ERC721( "WOMANNFT" , "WFT") {}

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
    // Get woman level using into NftFamily for create Family token
    function womanLevel() external view returns (uint8) {
        return womanNft[0].Level;
    } 


}
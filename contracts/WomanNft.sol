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

    mapping(address=>uint256)_womanId;

    // Generate Nft Man
    function generateNftWoman (uint8 age , uint8 level , string memory _name , string memory lastname , address owner, uint256 WomanId ) public {
        womanNft.push(Woman(age,level,_name,lastname));
        _safeMint(owner,WomanId);
        _womanId[owner] = WomanId;
    }

    // Show Woman Nft
    function showWoman() public view returns (Woman [] memory) {
        return womanNft ;
    }

    // Get woman level using into NftFamily for create Family token
    function womanLevel() external view returns (uint8) {
        return womanNft[0].Level;
    } 

    // Get woman Id
    function ShowWomanId (address owner) external view returns(uint256) {
        return _womanId[owner];
    }


}
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

    // Using adress of owner to watch dadId
    mapping(address=>uint256)_dadId;

    Man [] manNft;

    // Generate Nft Man
    function generateNftMan (uint8 age , uint8 level , string memory _name , string memory lastname , address owner ,uint256 DadId) public {
        manNft.push(Man(age,level,_name,lastname));
        _safeMint(owner ,DadId );
        _dadId[owner] = DadId;
    }

    // Show Man nft token
    function showMan() public view returns (Man [] memory) {
        return manNft ;
    }

    // Get man level using into NftFamily for create Family token
    function manLevel() external view returns (uint8) {
        return manNft[0].Level;
    }

    // Get man lastname using into NftFamily for create Family token
    function manLastname() external view returns (string memory) {
        return manNft[0].LastName;
    }

    // Get DadId
    function ShowDadId (address owner) external view returns(uint256) {
        return _dadId[owner];
    }

}
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

    // Save mans Id AFTER MINT and transfer it to kid
    mapping(address=>uint256)_dadId;

    // Save mans here
    Man [] manNft;

    // Generate Nft Man
    function generateNftMan (
        uint8 age,
        uint8 level,
        string memory _name,
        string memory lastname,
        address owner,
        uint256 DadId) public {
        manNft.push(Man(age,level,_name,lastname));
        _safeMint(owner ,DadId );
        _dadId[owner] = DadId;
    }

    // Show Man nft token
    function showMan() public view returns (Man [] memory) {
        return manNft ;
    }

    // Get man level using into NftFamily for create Family token
    function manLevel(uint256 manIdArray) external view returns (uint8) {
        return manNft[manIdArray].Level;
    }

    // Get man lastname using into NftFamily for create Family token
    function manLastname(uint256 manIdArray) external view returns (string memory) {
        return manNft[manIdArray].LastName;
    }

    // Get DadId
    function ShowDadId (address owner) external view returns(uint256) {
        return _dadId[owner];
    }

}
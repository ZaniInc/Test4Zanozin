// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

interface famNFT {

    function getFamilyLevel () external view returns (uint8);
    function getFamilyLastname () external view returns (string memory);
}

interface DadId {
    function ShowDadId (address owner) external view returns(uint256);
}

interface MomId {
    function ShowWomanId (address owner) external view returns(uint256);
}

contract Kidnft is ERC721 { 

    constructor () ERC721( "KIDNFT" , "KFT") {}

    struct Kid {
         uint8 Age;
         uint8 Level;
         string Name;
         string LastName;
         uint256 DadId;
         uint256 MomId;        
    }

    Kid [] kidArray;

    // Generate Kid Nft , take Level and Lastname from Family token
    function generateNftKid ( uint8 _age ,string memory _name  , famNFT nft , DadId dadAddress , MomId momAddress) public {
        kidArray.push(Kid(_age,nft.getFamilyLevel(),_name,nft.getFamilyLastname(),dadAddress.ShowDadId(msg.sender),momAddress.ShowWomanId(msg.sender)));
    }

    // Show Kid Nft
    function showKid() public view returns (Kid [] memory) {
        return kidArray;
    }


}
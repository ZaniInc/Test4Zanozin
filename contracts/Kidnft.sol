// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

interface famNFT {

    function getFamilyLevel (uint256 familyTokenId) external view returns (uint8);
    function getFamilyLastname (uint256 familyTokenId) external view returns (string memory);
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

    // Save kids here
    Kid [] kidArray;

    // Save Kid Id after mint
    mapping(address=>uint256)_kidIdSave;

    // Generate Kid Nft , take Level and Lastname from Family token
    function generateNftKid ( uint8 _age ,
    string memory _name,
    famNFT nft,
    DadId dadAddress,
    MomId momAddress,
    uint256 familyTokenId,
    address owner,
    uint256 _kidId) public {
        kidArray.push(Kid(_age,nft.getFamilyLevel(familyTokenId),
        _name,nft.getFamilyLastname(familyTokenId),
        dadAddress.ShowDadId(msg.sender),
        momAddress.ShowWomanId(msg.sender)));
        _safeMint(owner,_kidId);
        _kidIdSave[owner] = _kidId;
    }

    // Show Kid Nft
    function showKid() public view returns (Kid [] memory) {
        return kidArray;
    }


}
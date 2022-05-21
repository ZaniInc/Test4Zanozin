// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


import "./WomanNft.sol";

contract NftFamily is WomanNft { 

    uint8 [] membersOfFamily;

    struct NFTFamily {
        uint8 Members;
        uint8 Level;
        string LastName;
    }

    NFTFamily [] _familyTokens;

    // Generate token NFTfamily which contains level from parents and lastname from man
    function createFamilyNFT (uint8 ManId , uint8 WomanId) public {
        _familyTokens.push(NFTFamily(1,(manNft[ManId].Level + womanNft[WomanId].Level) / 2,manNft[ManId].LastName)) ;
    }

    // show token NFTfamily
    function showFamilyNft () public view returns(NFTFamily [] memory){
        return _familyTokens;
    }

}
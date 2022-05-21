// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Implementation ManNft functions
interface Man {
    function manLevel() external view returns (uint8) ;

    function manLastname() external view returns (string memory) ;
}

// Implementation WomanNft functions
interface Woman {
    function womanLevel() external view returns (uint8) ;
}

contract NftFamily is ERC721 { 

    constructor () ERC721( "FAMILYNFT" , "FFT") {}

    uint8 [] membersOfFamily;

    struct NFTFamily {
        uint8 Members;
        uint8 Level;
        string LastName;
    }

    NFTFamily [] _familyTokens;

    // Generate token NFTfamily which contains level from parents and lastname from man
    function createFamilyNFT (Man mannft , Woman womannft ) public {
        _familyTokens.push(NFTFamily(1,(mannft.manLevel() + womannft.womanLevel()) / 2, mannft.manLastname())) ;
    }

    // show token NFTfamily
    function showFamilyNft () public view returns(NFTFamily [] memory){
        return _familyTokens;
    }

    // Get Family token level to input in Kidnft
    function getFamilyLevel () external view returns (uint8) {
        return _familyTokens[0].Level;
    }

    // Get Family token lastname to input in Kidnft
    function getFamilyLastname () external view returns (string memory) {
        return _familyTokens[0].LastName;
    }

}
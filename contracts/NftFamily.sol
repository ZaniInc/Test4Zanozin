// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Implementation ManNft functions
interface Man {
    function manLevel(uint256 manIdArray) external view returns (uint8) ;

    function manLastname(uint256 manIdArray) external view returns (string memory) ;
}

// Implementation WomanNft functions
interface Woman {
    function womanLevel(uint256 womanIdArray) external view returns (uint8) ;
}

contract NftFamily is ERC721 { 

    constructor () ERC721( "FAMILYNFT" , "FFT") {}

    uint8 [] membersOfFamily;

    struct NFTFamily {
        uint8 Members;
        uint8 Level;
        string LastName;
    }

    // Family tokens save here
    NFTFamily [] _familyTokens;

    // Generate token NFTfamily which contains level from parents and lastname from man
    function createFamilyNFT (Man mannft , Woman womannft , uint256 womanIndexArray , uint256 manIndexArray) public {
        _familyTokens.push(NFTFamily(1,(mannft.manLevel(manIndexArray) + womannft.womanLevel(womanIndexArray)) / 2, mannft.manLastname(manIndexArray))) ;
    }

    // show token NFTfamily
    function showFamilyNft () public view returns(NFTFamily [] memory){
        return _familyTokens;
    }

    // Get Family token level to input in Kidnft , take number of array index
    function getFamilyLevel (uint256 familyTokenId) external view returns (uint8) {
        return _familyTokens[familyTokenId].Level;
    }

    // Get Family token lastname to input in Kidnft , take number of array index
    function getFamilyLastname (uint256 familyTokenId) external view returns (string memory) {
        return _familyTokens[familyTokenId].LastName;
    }

}
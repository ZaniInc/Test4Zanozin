// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./ManNft.sol";
import "./WomanNft.sol";

contract KidNft is ManNft , WomanNft { 

    struct Kid {
         uint8 Age;
         uint8 Level;
         string Name;
         string LastName;        
    }


}
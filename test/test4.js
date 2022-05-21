const {expect} = require("chai");
const {ethers} = require("hardhat");

describe("NFTFamily" , function () {

let owner;
let acc2 , acc3;
let NftFamily;
let Kidnft;

 before(async function () {

    [owner , acc2 , acc3] = await ethers.getSigners();
    const Kidnft = await ethers.getContractFactory("Kidnft" , owner);
    kidnft = await Kidnft.deploy();
    await kidnft.deployed();

    const NftFamily = await ethers.getContractFactory("NftFamily" , owner);
    nftfamily = await NftFamily.deploy();
    await nftfamily.deployed();
    
    
 });


 it("set man field nft" , async function () {

    let man = await nftfamily.generateNftMan(26,8,"Oleg","Kravec");
    await man.wait();
    // expect(await TokenForPayy.connect(acc2).balanceOf(acc2.address)).to.eq(10000);
    console.log("Man NFT :",await nftfamily.showMan() );
   
   });

 it("set woman field nft" , async function () {

    let woman = await nftfamily.generateNftWoman(22,4,"Alena","Tkach");
    await woman.wait();
    // expect(await TokenForPayy.connect(acc2).balanceOf(acc2.address)).to.eq(10000);
    console.log("Woman NFT :",await nftfamily.showWoman() );
   
   });

 it("set family field nft" , async function () {

    let familyNftt = await nftfamily.createFamilyNFT(0,0);
    await familyNftt.wait();
    // expect(await TokenForPayy.connect(acc2).balanceOf(acc2.address)).to.eq(10000);
    console.log("Family NFT :",await nftfamily.showFamilyNft() );
   
   }); 

   it("set kid nft" , async function () {

    let kid = await kidnft.generateNftKid(4,"Nikita",0);
    await kid.wait();
    // expect(await TokenForPayy.connect(acc2).balanceOf(acc2.address)).to.eq(10000);
    console.log("Kid NFT :",await kidnft.showKid() );
   
   });  



});
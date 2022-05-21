const {expect} = require("chai");
const {ethers} = require("hardhat");

describe("NFTFamily" , function () {

let owner;
let acc2 , acc3;
let NftFamily;
let Kidnft;
let ManNft;
let WomanNft

 before(async function () {

    [owner , acc2 , acc3] = await ethers.getSigners();

    const ManNft = await ethers.getContractFactory("ManNft" , owner);
    mannft = await ManNft.deploy();
    await mannft.deployed();
    
    const WomanNft = await ethers.getContractFactory("WomanNft" , owner);
    womannft = await WomanNft.deploy();
    await womannft.deployed();

    const NftFamily = await ethers.getContractFactory("NftFamily" , owner);
    nftfamily = await NftFamily.deploy();
    await nftfamily.deployed();

    const Kidnft = await ethers.getContractFactory("Kidnft" , owner);
    kidnft = await Kidnft.deploy();
    await kidnft.deployed();

    
    
    
 });


 it("set man field nft" , async function () {

    let man = await mannft.generateNftMan(26,8,"Oleg","Kravec",owner.address,333);
    await man.wait();
    // expect(await TokenForPayy.connect(acc2).balanceOf(acc2.address)).to.eq(10000);
    console.log("Man NFT :",await mannft.showMan() );
   
   });

 it("set woman field nft" , async function () {

    let woman = await womannft.generateNftWoman(22,4,"Alena","Tkach",owner.address,101);
    await woman.wait();
    // expect(await TokenForPayy.connect(acc2).balanceOf(acc2.address)).to.eq(10000);
    console.log("Woman NFT :",await womannft.showWoman() );
   
   });

 it("set family field nft" , async function () {

    let familyNftt = await nftfamily.createFamilyNFT(mannft.address , womannft.address , 0,0);
    await familyNftt.wait();
    // expect(await TokenForPayy.connect(acc2).balanceOf(acc2.address)).to.eq(10000);
    console.log("Family NFT :",await nftfamily.showFamilyNft() );
   
   }); 

   it("set kid nft" , async function () {

    let kid = await kidnft.generateNftKid(4,"Nikita",nftfamily.address,mannft.address,womannft.address,0);
    await kid.wait();
    // expect(await TokenForPayy.connect(acc2).balanceOf(acc2.address)).to.eq(10000);
    console.log("Kid NFT :",await kidnft.showKid() );
   
   });  



});
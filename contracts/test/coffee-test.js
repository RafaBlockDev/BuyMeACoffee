const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Coffee", function () {
  it("Should return the new coffee once it's changed", async function () {
    console.log("Compiling smart contract... 📝")
    const Coffee = await ethers.getContractFactory("Coffee");
    console.log("Deploying smart contract... 🎉")
    const coffee = await Coffee.deploy("Hello, world!");
    await coffee.deployed();
  });
});

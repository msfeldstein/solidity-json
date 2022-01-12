const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("JSON", function () {
  it("creates valid json", async function () {
    const JSONBuilder = await ethers.getContractFactory("JSON");
    const jsonBuilder = await JSONBuilder.deploy();
    await jsonBuilder.deployed();

    const TestContract = await ethers.getContractFactory("Test", {
      libraries: {
        JSON: jsonBuilder.address
      }
    });
    const contract = await TestContract.deploy();
    await contract.deployed();
    const json = await contract.generate("Michael", "Good", 420)
    console.log(json)
  });
});

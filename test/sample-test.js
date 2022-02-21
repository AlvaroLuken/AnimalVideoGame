const { expect, assert } = require("chai");
const { ethers } = require("hardhat");

describe("JokerToken", function () {
  let token;
  let initialSupply;
  let owner, recipient;
  before(async () => {
    [owner, recipient] = await ethers.provider.listAccounts();
    const JokerToken = await ethers.getContractFactory("JokerToken");
    initialSupply = ethers.utils.parseEther("1000");
    token = await JokerToken.deploy(initialSupply);
    await token.deployed();
  });
  it("Should mint the initial supply to the owner", async function () {
    const balance = await token.balanceOf(owner);
    assert.equal(balance.toString(), initialSupply.toString());
  });

  describe("after we have minted, transfer some tokens", () => {
    let transferAmount = ethers.utils.parseEther("900");
    before(async () => {
      await token.transfer(recipient, transferAmount);
    });

    it("should decrease the owner's balance", async function () {
      
      const balance = await token.balanceOf(owner);
      assert.equal(balance.toString(), ethers.utils.parseEther("100"));
    });

    it("should increase the recipient's balance", async function () {
      
      const balance = await token.balanceOf(recipient);
      assert.equal(balance.toString(), ethers.utils.parseEther("900"));
    });

    describe("should approve the recipient to spend our tokens", () => {
      let approvalAmount = ethers.utils.parseEther("100");
      before(async () => {
        await token.approve(recipient, approvalAmount);
      });

      it("should update the allowances", async function () {
      
        const allowance = await token.allowance(owner, recipient);
        assert.equal(allowance.toString(), ethers.utils.parseEther("100"));
      });
    });
  })
});

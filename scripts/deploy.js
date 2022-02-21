async function main() {
  const initialSupply = ethers.utils.parseEther("10000");
  const BabyToken = await hre.ethers.getContractFactory("JokerToken");
  const token = await BabyToken.deploy(initialSupply);

  await token.deployed();

  console.log("token deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
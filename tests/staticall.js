const { expect } = require("chai");


//Testing the static contract call 

describe("Math Contract", function () {
  let MathContract;
  let mathContract;
  let MathCaller;
  let mathCaller;
  let owner;
  let user;

  before(async () => {
    [owner, user] = await ethers.getSigners();

    // Deploy Math contract
    MathContract = await ethers.getContractFactory("Math");
    mathContract = await MathContract.deploy();

    // Deploy MathCaller contract
    MathCaller = await ethers.getContractFactory("MathCaller");
    mathCaller = await MathCaller.deploy(mathContract.address);
  });

  describe("someMaths function", function () {
    it("should perform a mathematical operation correctly", async function () {
      // Set numbers in Math contract
      await mathContract.setNumbers(5, 10);

      // Call someMaths function in MathCaller contract
      const result = await mathCaller.callSomeMaths(3);

      // The result should be the sum of 5 + 10 + 3
      expect(result).to.equal(18);
    });

    it("should revert if _yNumber is 0", async function () {
      // Attempt to call someMaths with _yNumber as 0
      await expect(mathCaller.callSomeMaths(0)).to.be.revertedWith("The Number can't be 0");
    });
  });

  describe("setNumbers function", function () {
    it("should set xNumber and zNumber correctly", async function () {
      // Set numbers in Math contract
      await mathContract.setNumbers(15, 20);

      // Check if xNumber and zNumber are set correctly
      expect(await mathContract.xNumber()).to.equal(15);
      expect(await mathContract.zNumber()).to.equal(20);
    });
  });
});

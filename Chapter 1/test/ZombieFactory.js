var ZombieFactorytestContract = artifacts.require("./ZombieFactory");

contract("ZombieFactory", function(accounts) {
  it("Launch the contract, write initial Record", async function() {
    let instance = await ZombieFactorytestContract.deployed();
    let tx = await instance.createRandomZombie("text", {
      from: accounts[0]
    });
    tx = await instance.createRandomZombie("text", {
      from: accounts[1]
    });
    tx = await instance.createRandomZombie("t", {
      from: accounts[2]
    });
/*    assert.equal(tx.logs[0].event, "ActionAddRecord");
    assert.equal(tx.logs[0].args.projectId, 0); */
  });

});

var ZombieFactorytestContract = artifacts.require("./ZombieFactory");

contract("ZombieFactory", function(accounts) {
  // Test req
  it("Launch the contract, Test req C1_6", async function() {
    let instance = await ZombieFactorytestContract.deployed();
    let tx = await instance
      .createRandomZombie("text", { from: accounts[0] })
      .then(function(result) {
        for (var i = 0; i < result.logs.length; i++) {
          var log = result.logs[i];
          if (log.event == "NewZombie") {
            var n = log.args.zombieId;
            n = n.toNumber();
            console.log(n); // Print id
            var d = log.args.name;
            console.log(d); // Print name
            var d = log.args.dna;
            d = d.toNumber(); // Print dna
            console.log(d);
          }
        }
      });
    /*    assert.equal(tx.logs[0].event, "ActionAddRecord");
    assert.equal(tx.logs[0].args.projectId, 0); */
  });
  it("Test reqs C1_5 and C1_6", async function() {
    let instance = await ZombieFactorytestContract.deployed();
    let tx = await instance
      .createRandomZombie("tex2", { from: accounts[0] })
      .then(function(result) {
        for (var i = 0; i < result.logs.length; i++) {
          var log = result.logs[i];
          if (log.event == "NewZombie") {
            var n = log.args.zombieId;
            n = n.toNumber();
            console.log(n);
            var d = log.args.dna;
            d = d.toNumber();
            console.log(d);
          }
        }
      });
    /*    assert.equal(tx.logs[0].event, "ActionAddRecord");
    assert.equal(tx.logs[0].args.projectId, 0); */
  });
});

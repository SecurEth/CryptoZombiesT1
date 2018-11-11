/*pragma solidity ^0.4.24; 
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ZombieFactory.sol";

contract TestZombieFactory {

    function testCreateInitialZombie() private {
        ZombieFactory randomZombie = ZombieFactory(DeployedAddresses.ZombieFactory());
        randomZombie.createRandomZombie("test2");
//        Assert.equal(1, 1, "First number set should be 24.");
    }

/*    function testGoodZombieName() private {
        ZombieFactory randomZombie = new ZombieFactory();
        ThrowProxy throwproxy = new ThrowProxy(address(randomZombie));
        ZombieFactory(address(throwproxy)).createRandomZombie("test2");
        bool r = throwproxy.execute.gas(200000)();
        Assert.isTrue(r, "Should be true because is should throw!");
    } 
}



// Proxy contract for testing throws
contract ThrowProxy {
    address public target;
    bytes data;

    function ThrowProxy(address _target) public {
        target = _target;
    }

  //prime the data using the fallback function.
    function() public {
        data = msg.data;
    }

    function execute() public returns (bool) {
        return target.call(data);
    }
} */
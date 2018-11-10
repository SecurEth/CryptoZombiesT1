pragma solidity ^0.4.24;

/// @title CryptoZombies Chapter 2
/// @author H4XF13LD MORRIS 💯💯😎💯💯 (documentation by Rex Hygate)
// @Github https://github.com/SecurEth/CryptoZombiesT1/Chapter2
// @SDD "./doc./System Description Document.md"
// @ARCH ./doc/Crpto...

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;    

// req C1_1 Push the Zombie attributes in the zombies struct
// req C1_2 Emit the Zombie id, name and dna
    function _createZombie(string _name, uint _dna) internal {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna); // emit added to better compile
    } 
// @req C1_3 Generate a pseudo random number from a string which is returned as the dna
// @req C1_4 Throw an error if string length 1 char or less
// @req C1_5 Create id which represents the index of the Zombie in the struct on blockchain
    function _generateRandomDna(string _str) private view returns (uint) {
//        require(byte(_str).length > 1, "Name too short");  // New code added for tests
        uint rand = uint(keccak256(abi.encodePacked(_str))); //abi.encoded added to remove compiler warnings 
        return rand % dnaModulus;
    }

// @req C1_6 Make Zombie in struct and emit id, name and dna
    function createRandomZombie(string _name) public {
        require(ownerZombieCount[msg.sender] == 0, "j");
        uint randDna = _generateRandomDna(_name);
        randDna = randDna - randDna % 100;
        _createZombie(_name, randDna);
    }

}

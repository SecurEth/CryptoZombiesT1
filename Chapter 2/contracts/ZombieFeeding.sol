pragma solidity ^0.4.19;
/// @title CryptoZombies Chapter 1
/// @author H4XF13LD MORRIS 💯💯😎💯💯 (documentation by Rex Hygate)
// @Github http:\\
// @SDD ./doc./Crypto
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
// req # Push the Zombie attributes in the zombies struct
// req # Emit the Zombie id, name and dna
    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
        // and fire it here
    } 
// @req # Generate a pseudo random number from a string which is returned as the dna
// @req # Throw an error if string length 1 char or less
// @req # Create id which represents the index of the Zombie in the struct on blockchain
    function _generateRandomDna(string _str) private view returns (uint) {
//        require(byte(_str).length > 1, "Name too short");  // New code added for tests
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

// @req # Make Zombie in struct and emit id, name and dna
    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}

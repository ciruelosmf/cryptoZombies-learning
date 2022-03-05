pragma solidity ^0.4.19;

import "./zombiefeeding.sol";












contract ZombieHelper is ZombieFeeding {








  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
    
  }














  function changeName(uint _zombieId, string _newName) external aboveLevel(2, _zombieId) {
          
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].name = _newName;
    
  }
















  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
          
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].dna = _newDna;
    
  }












  function getZombiesByOwner(address _owner) external view returns(uint[])  {
          
    uint[] memory result = new uint[](ownerZombieCount[_owner]);
    // Empieza aquí
    uint counter = 0;
     for (uint i = 0; i < zombies.length; i++)   {
                    // Si `i` es par...
            if (zombieToOwner[i] == _owner) {
                      // Añadelo a nuestro array
                    result[counter] = i;
                      // Incrementamos el contador al nuevo índice vacío de `evens`:
                    counter++;
                                            }
                                                 }

    return result;
                                                                            }

}







}

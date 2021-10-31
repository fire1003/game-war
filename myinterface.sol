pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;


interface myinterface {
  
 // function prinattack(uint attack) external;
  function addunit(string name, uint attkunit, uint defunit, uint lifeonit) external;
  function prinattack(uint powerattk) external;
  function sendTransaction_all_delete(address dest) external;
 
}
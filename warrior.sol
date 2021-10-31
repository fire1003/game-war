pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "./myunit.sol";

contract warrior is myunit {

	
	
	constructor(myinterface addrbaza, uint attkunit, uint defunit, uint lifeunit) public checkOwnerAndAccept{
		addrbaza.addunit("warrior", attkunit, defunit, lifeunit);
		 addvoenunit(addrbaza,"warrior", attkunit, defunit, lifeunit);
	}


	function getattkunit() public checkOwnerAndAccept returns (uint){
		return attk;
	}

	function getdefkunit() public checkOwnerAndAccept returns (uint){
		return def;
	}

	function getlifekunit() public checkOwnerAndAccept returns (uint){
		return life;
	}

}


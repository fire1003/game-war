pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "./igrovoiobj.sol";

contract myunit is igrovoiobj {

string name;
uint attk;
uint def;
uint life;
myinterface adrrbaza;

	function addvoenunit(myinterface addrbaza, string nameunit, uint attkunit, uint defunit, uint lifeunit) public checkOwnerAndAccept{
		adrrbaza=addrbaza;
		name=nameunit;
		attk=attkunit;
		def=defunit;
		life=lifeunit;
	}


	function ataka (myinterface addrbaza) public checkOwnerAndAccept{
		addrbaza.prinattack(attk);
	}
	
	


}
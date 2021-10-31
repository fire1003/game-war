pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "./myinterface.sol";

contract igrovoiobj is myinterface {


	modifier checkOwnerAndAccept {
		// Check that message was signed with contracts key.
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
		_;
	}

	function addunit(string name, uint attkunit, uint defunit, uint lifeonit) virtual external override
	{

	}

	function prinattack(uint powerattk) virtual external override
	{

	}

	function sendTransaction_all_delete(address dest) virtual external override  {
		tvm.accept();
	    dest.transfer(0, true, 160);
    }

	function kill (myinterface addrbaza) public {
		tvm.accept();
		addrbaza.sendTransaction_all_delete(msg.sender);

	}


 /*   function prinattack(uint value) virtual public override  {
        tvm.accept();
    }*/

}
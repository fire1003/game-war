pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "./igrovoiobj.sol";

contract mybaza is igrovoiobj {

	uint public def;
    uint public life;

	int8[] public keyunit =[int8(0)];
	struct unit{
		string name;
        uint attk;
        uint def;
		uint life;
        myinterface adr;
	}
    mapping(int8 => unit) public arrayunit;
	

	constructor(uint defbaza, uint lifebaza) public checkOwnerAndAccept{
		def=defbaza;
		life=lifebaza;
	}

	function addunit(string name, uint attkunit, uint defunit, uint lifeunit) virtual external override {
		tvm.accept();
		arrayunit[keyunit[keyunit.length-1]] = unit(name, attkunit, defunit, lifeunit, myinterface(msg.sender));
		keyunit.push(keyunit[keyunit.length-1]+int8(1));
	}


	function prinattack(uint powerattk) virtual external override {
		tvm.accept();
		int8 i1;
		
 		for (int8 i = 0; i < int8(keyunit.length-1); i++) {
			if(arrayunit[keyunit[uint256(i)]].name!="" && arrayunit[keyunit[uint256(i)]].life!=0){
				 i1=i;
				 i=int8(keyunit.length);
			}
		}

		if(powerattk>arrayunit[i1].def){
			if( arrayunit[i1].life <= (powerattk-arrayunit[i1].def) ){  //значит убит юнит

				//вписать вызов функции что убит юнит
				kill(arrayunit[i1].adr);
				delete arrayunit[i1];
				
				if( powerattk >def ){//значит пробили защиту базы нужно бить жизнь базы
					if( (powerattk-def)>=life ){ //значит убили базу
					//вписать уничтожение всех живых юнитов
						for (int8 i = 0; i < int8(keyunit.length-1); i++) {
							if(arrayunit[keyunit[uint256(i)]].name!="" && arrayunit[keyunit[uint256(i)]].life!=0){
								kill(arrayunit[i].adr);
								delete arrayunit[i];
							}
						}
					//вписать уничтожение самой базы
						msg.sender.transfer(0, true, 160);
					}else{//не убили базу, уменьшаем жизнь базы
						life=life-(powerattk-def);
					}
				}
			
			}else{//не убили юнита, уменьшаем жизнь юнита
				arrayunit[i1].life=arrayunit[i1].life-(powerattk-arrayunit[i1].def);
			}
		}
		
	}


	function getdefbaza() public checkOwnerAndAccept returns (uint){
		return def;
	}

	function getlifebaza() public checkOwnerAndAccept returns (uint){
		return life;
	}


}
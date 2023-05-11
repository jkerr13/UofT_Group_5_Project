pragma solidity ^0.5.0;

import "./TerraCarbon.sol";

contract TerraCarbonToken {
    address payable owner = msg.sender;
    string public symbol = "TERA";
    uint public exchange_rate = 100;

    mapping(address => uint) balances;

    function balance() public view returns(uint) {
        return balances[msg.sender];
    }

    function transfer(address recipient, uint value) public{
        balances[msg.sender] -= value;
        balances[recipient] -= value;
    }

    function purchase() public payable {
        uint amount = msg.value * exchange_rate;
        balances[msg.sender] += amount;
        owner.transfer(msg.value);
    }

    function mint(address recipient, uint value) public {
        require(msg.sender == owner, "You are not authorized to mint these tokens");
        balances[recipient] += value;
    }

}

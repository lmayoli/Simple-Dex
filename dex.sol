// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./erc20.sol";

contract dexx{
    address payable buyer;
    address payable seller;
    uint TokenValue = 10 wei;
    uint tokenSupply;
    uint tokenbalance;
    uint tokenAmount;
    
    

    constructor() payable {
        buyer = payable(msg.sender);
    }
    
    event buy(uint _amount, address from);
    event sell(uint _amount, address to);
    
    function buyToken()public payable {
        if (buyer.balance > TokenValue)
        emit buy(msg.value, buyer);
        buyer.transfer(TokenValue);
        ++tokenbalance;
        tokenSupply+=1;
        }

    function sellToken()public payable {
        seller.transfer(TokenValue);
        emit sell(msg.value,msg.sender);
        tokenbalance = tokenSupply -1; 
        
    }
    
    function tokensupply()public view returns(uint){
       uint _amount = tokenbalance;
       return(_amount);

    }
    function setToken(address _token)public pure returns(address) {
        return (_token);
    }
   
    
    function getBalance()public view returns(uint){
        return (address(this).balance);
    }
}


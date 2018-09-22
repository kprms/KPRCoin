pragma solidity ^0.4.24;  

import "openzeppelin-solidity/contracts/token/ERC20/CappedToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";
  
contract KPRCoin is CappedToken, BurnableToken {  
  
  string public name = "KPR Coin";  
  string public symbol = "KPR";  
  uint8 public decimals = 4; 
  uint256 public cap = 100000000 * (10 ** uint256(decimals));   

  modifier validDestination( address to ) {
    require(to != address(0x0), "Cannot send to genesis address");
    require(to != address(this), "Cannot send to contract address");
    _;
  } 

  constructor() public CappedToken(cap) {   
  }

  function transfer(address _to, uint _value) public validDestination(_to) returns (bool) 
  {
    return super.transfer(_to, _value);
  }

  function transferFrom(address _from, address _to, uint _value) public validDestination(_to) returns (bool) 
  {
    return super.transferFrom(_from, _to, _value);
  }
}
// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.4; 
 
import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol"; 
import "@openzeppelin/contracts/security/Pausable.sol"; 
import "@openzeppelin/contracts/access/Ownable.sol"; 
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol"; 
 
contract DEERcoin is ERC20, ERC20Burnable, Pausable, Ownable, ERC20Permit { 
    constructor() ERC20("DEERcoin", "deer") ERC20Permit("DEERcoin") { 
        _mint(msg.sender, 100000000000000000 * 10 ** decimals()); 
    } 
 
    function pause() public onlyOwner { 
        _pause(); 
    } 
 
    function unpause() public onlyOwner { 
        _unpause(); 
    } 
 
    function _beforeTokenTransfer(address from, address to, uint256 amount) 
        internal 
        whenNotPaused 
        override 
    { 
        super._beforeTokenTransfer(from, to, amount); 
    } 
}

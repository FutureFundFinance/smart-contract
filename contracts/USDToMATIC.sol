pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract USDToMATIC is Ownable {
    IERC20 public maticToken;
    uint256 public conversionRate;

    constructor(address _maticAddress, uint256 _conversionRate) {
        maticToken = IERC20(_maticAddress);
        conversionRate = _conversionRate;
    }

    function convertToUSD() public payable {
        // Convert the sent USD to MATIC
        uint256 usdAmount = msg.value;
        uint256 maticAmount = usdAmount * conversionRate;

        // Transfer the converted MATIC to the contract owner's address
        maticToken.transferFrom(msg.sender, owner(), maticAmount);
    }

    function withdrawMATIC() public onlyOwner {
        // Transfer the contract's MATIC balance to the owner's address
        uint256 balance = maticToken.balanceOf(address(this));
        maticToken.transfer(owner(), balance);
    }

    function addMATIC(address payable _receiver) public onlyOwner {
        // Add the contract's MATIC balance to the receiver's address on the Polygon network
        uint256 balance = maticToken.balanceOf(address(this));
        maticToken.transfer(_receiver, balance);
    }
}
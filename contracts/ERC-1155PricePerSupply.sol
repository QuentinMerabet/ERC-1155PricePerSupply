// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC1155PricePerSupply is ERC1155, ERC1155Supply, Ownable {
    uint256 constant pricePerSupply = 0.001 ether;

    constructor() ERC1155("https://quentinmerabet.com/metadata.json") {}

    function mint() public payable {
        uint256 price = getNextPrice();
        require(msg.value >= price, "ERC1155PricePerSupply: amount too low.");
        _mint(msg.sender, 1, 1, "");
    }

    function getNextPrice() public view returns (uint256 nextPrice) {
        return (totalSupply(1) + 1) * pricePerSupply;
    }

    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override(ERC1155, ERC1155Supply) {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}

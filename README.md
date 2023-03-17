# ERC1155PricePerSupply

ERC1155PricePerSupply is a smart contract written in Solidity that implements the ERC-1155 standard for multi-token contracts with a fun twist.

### Where's the fun?

Designed for open editions, it allows users to mint tokens with a fixed price per supply.
_Meaning the price will increase at every mint._

### Why?

It's a unique way to limit the supply. No more hard decision about the price of your art. No more unlimited supply. No more underground floor price.

## Contract Functions

`mint()`
Mints a new token with a fixed price per supply. The caller must provide enough Ether to cover the current price of the token (or more, if he wants to be sure the tx works in case of high demand). The function will revert if the amount of Ether sent is less than the current price.

`getNextPrice()`
Returns the price for the next token to be minted.

`withdraw()`
Transfers the contract's Ether balance to the contract owner.

## Contract Variables

`pricePerSupply`
The fixed price per supply of tokens.

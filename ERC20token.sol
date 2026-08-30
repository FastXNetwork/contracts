// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract FastXNetworkToken is ERC20, ERC20Burnable {
    error ZeroRecipient();
    error InitialSupplyTooLarge();

    uint256 private constant UNIT = 1e18;

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 initialSupply,
        address recipient
    ) ERC20(name_, symbol_) {
        if (recipient == address(0)) revert ZeroRecipient();

        if (initialSupply > type(uint256).max / UNIT) {
            revert InitialSupplyTooLarge();
        }

        _mint(recipient, initialSupply * UNIT);
    }
}

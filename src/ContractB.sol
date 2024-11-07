// SPDX-License-Identifier: MIT
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

pragma solidity ^0.8.19;

contract contractB is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 public amount;

    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function initialAmount(uint256 _amount) public returns (uint256) {
        amount = _amount;
        return amount;
    }

    function inc() public returns (uint256) {
        amount += 100;
        return amount;
    }

    function getAmount() public returns (uint256) {
        return amount;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    function dec() public returns (uint256) {
        amount -= 2;
        return amount;
    }
}

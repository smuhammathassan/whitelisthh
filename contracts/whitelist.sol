//SPDX-Licence-Identifier: UNLICENSED

pragma solidity ^0.8.4;

contract whitelist {
    uint8 public maxNumberOfAddresses;
    uint8 public numberOfAddressWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxNumberOfAddresses) {
        maxNumberOfAddresses = _maxNumberOfAddresses;
    }

    function addtoWhitelist() public {
        require(
            maxNumberOfAddresses < numberOfAddressWhitelisted,
            "Already crossed limit!"
        );
        require(!whitelistedAddresses[msg.sender], "Already in whitelist");

        whitelistedAddresses[msg.sender] = true;
        numberOfAddressWhitelisted += 1;
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library OracleLib {
    error OracleLib_StalePrice();

    uint256 private constant TIMEOUT = 3 hours;

    function stalePriceCheck(AggregatorV3Interface priceFeed)
        public
        view
        returns (uint80, int256, uint256, uint256, uint80)
    {
        (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) =
            priceFeed.latestRoundData();
        uint256 secondsSince = block.timestamp - updatedAt;
        if (secondsSince > TIMEOUT) revert OracleLib_StalePrice();
        return (roundId, answer, startedAt, updatedAt, answeredInRound);
    }
}

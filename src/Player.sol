// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {IPlayer, Throw} from "rock-paper-showtime/src/interfaces/IPlayer.sol";

contract Player is IPlayer {
    function firstThrow(string calldata opponentName)
        external
        pure
        returns (Throw)
    {
        if (keccak256(bytes(opponentName)) == keccak256("Avalanche")) {
            return Throw.Rock;
        } else if (keccak256(bytes(opponentName)) == keccak256("ritz")) {
            return Throw.Scissors;
        } else {
            return Throw.Paper;
        }
    }

    function nextThrow(Throw prevOpponentThrow) external pure returns (Throw) {
        if (prevOpponentThrow == Throw.Rock) {
            return Throw.Paper;
        } else if (prevOpponentThrow == Throw.Paper) {
            return Throw.Scissors;
        } else {
            return Throw.Rock;
        }
    }
}

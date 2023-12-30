// SPDX-License-Identifier: MIT
pragma solidity >=0.7.6;

contract Math {
    // State variables to store numbers
    uint256 public xNumber; 
    uint256 public zNumber; 


     /**
     * @dev Set the values of the state variables.
     * @param _xNumber The value to set for xNumber.
     * @param _zNumber The value to set for zNumber.
     */
    function setNumbers(uint256 _xNumber, uint256 _zNumber) public {
        // Set the values of the state variables
        xNumber = _xNumber; 
        zNumber = _zNumber;
    }

    /**
     * @dev Perform a mathematical operation by adding two state variables and an input parameter.
     * @param _yNumber The input parameter to be added.
     * @return result The result of the mathematical operation.
     */
    function someMaths(uint256 _yNumber) public view returns (uint256) {
        // Ensure the input parameter is greater than 0
        require(_yNumber > 0, "The Number can't be 0");

        // Perform the mathematical operation
        uint256 result = xNumber + zNumber + _yNumber; 

        // Return the result
        return result; 
    }

   
}

/**
 * @title MathCaller
 * @dev A contract to test the `someMaths` function of the Math contract using staticcall.
 */
contract MathCaller {
    // Instance of the Math contract
    Math public mathContract;

    /**
     * @dev Constructor to set the Math contract address.
     * @param _mathContract The address of the Math contract to interact with.
     */
    constructor(address _mathContract) {
        mathContract = Math(_mathContract);
    }

    /**
     * @dev Call the `someMaths` function of the Math contract using staticcall.
     * @param _yNumber The input parameter for the `someMaths` function.
     * @return sum The result of the staticcall.
     */
    function callSomeMaths(uint256 _yNumber) external view returns (uint256) {
        // Perform a staticcall to the `someMaths` function of the Math contract
        (bool success, bytes memory result) = address(mathContract).staticcall(
            abi.encodeWithSignature("someMaths(uint256)", _yNumber)
        );

        // Ensure the staticcall was successful
        require(success, "Staticcall failed");

        // Decode the result from the staticcall
        uint256 sum;
        assembly {
            sum := mload(add(result, 0x20))
        }

        // Return the decoded result
        return sum;
    }
}

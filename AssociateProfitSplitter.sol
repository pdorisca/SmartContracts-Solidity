pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one; // 0xB8f9EE94cAE293D1C9836948a342447159eFd235
    address payable employee_two; // 0xC20D4A0B5DB447c40f9f8ED53e9f454705dF602F
    address payable employee_three; // 0x7E477904ABe1a220ba281c30B66CF6cE66D80F53

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value / 3; 

        // @TODO: Transfer the amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount); 
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
         msg.sender.transfer(msg.value - (amount *3));
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        deposit();
        
    }
}

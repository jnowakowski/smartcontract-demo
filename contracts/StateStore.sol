pragma solidity ^0.4.24;

contract StateStore
{  

    struct User
    {
        string name;
        uint state;
    }

    bool active;
    address[] usersLog;
    mapping(address => User) userStates;
 
    constructor() public{
        active = false;
    }

    function saveUserState(string _name, uint _state) external{
        bytes memory name = bytes(_name);
        require(name.length > 0, "name cannot be empty.");
        userStates[msg.sender] = User(_name, _state);
    }

    function readUserState(address _addr) external view returns(string _name, uint _state){
        User memory user = userStates[_addr];

        return (user.name, user.state); 
    }

    function readUsersLog() external view returns (address[] _addr){
        return usersLog;
    }

    function isActive() external view returns(bool){
        return active;
    }

    function setActive(bool _flag) external{
        active = _flag;
        usersLog.push(msg.sender);
    }
 }
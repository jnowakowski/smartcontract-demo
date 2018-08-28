pragma solidity ^0.4.24;

contract StateStore
{  

    struct User
    {
        string name;
        uint state;
    }

    address[] usersLog;
    mapping(address => User) userStates;
 
    function saveUserState(string _name, uint _state) external{
        bytes memory name = bytes(_name);
        require(name.length > 0, "name cannot be empty.");

        usersLog.push(msg.sender);
        userStates[msg.sender] = User(_name, _state);
    }

    function readUserState(address _addr) external view returns(string _name, uint _state){
        User memory user = userStates[_addr];

        return (user.name, user.state); 
    }

    function readUsersLog() external view returns (address[] _addr){
        return usersLog;
    }
 }
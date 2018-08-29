var IOT = artifacts.require("../contracts/IOTLamp.sol");

const assert = require("chai").assert;

contract('IOTLamp', function(accounts) {  
  it("readUsersLog", function() {
    return IOT.deployed().then(async function(iot) {

      let result = await iot.readUsersLog();
      console.log(result);
      assert.isEmpty(result);

    });
  })
});
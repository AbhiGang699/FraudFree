pragma solidity >=0.5.0 <0.7.0;

contract AdFactory {
    Ad[] public deployedAds;

    function createAd(string memory name ,uint price , string memory desc,string memory loc,uint con) public {

        address payable manager = address(uint160(msg.sender));
        Ad newAd = new Ad(name,manager,price,desc,loc,con);
        deployedAds.push(newAd);
    }

    function getDeployedAds() public view returns(Ad[] memory) {
        return deployedAds;
    }
}

contract Ad {
    
    string public name;
    address payable public seller;
    uint public priceQuoted;
    string public description;
    string public location;
    uint public contact;

    constructor(string  memory creaname ,address payable crea, uint price, string  memory desc, string memory loc, uint con ) public {
        name = creaname;
        seller = crea;
        priceQuoted = price;
        description = desc;
        location = loc;
        contact = con;
    }

    
    function buyProduct() public payable {
    }

    function finalise() public {
        seller.transfer(address(this).balance);
    }
    
}

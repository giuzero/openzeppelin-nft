//contracts/TerrificCollectible.sol
//SPDX-License-Identifier: MIT

pragma solidity^0.7.4;
//@openzeppelin
import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-solidity/contracts/utils/Counters.sol";


//I want an NFT with no fungibility support so I want 721
contract TerrificCollectible is ERC721{
    
    //to assign ids...
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    //... image hashes
    mapping(string => uint8) hashes;

    constructor () public ERC721("TerrificCollectible","TERC") {}

    /**
    ownerAtTheMoment = who buys
    hash = the hash
    metadata = whatever
     */
    function assignTerc(address ownerAtTheMoment, string memory hash, string memory metadata)
        public
        returns (uint256){
            require(hashes[hash] !=1); //has the hash been used before? if yes reject the contract 
            hashes[hash]=1; //if not set the hash to 1
            _tokenIds.increment();
            uint256 newItemId = _tokenIds.current();
            _mint(ownerAtTheMoment,newItemId);
            _setTokenURI(newItemId, metadata);
            return newItemId;
        }


}

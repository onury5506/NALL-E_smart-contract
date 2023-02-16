pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NALLENFT is Ownable, ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    uint256 public MAX_SUPPLY = 1024;

    constructor() ERC721("NALL-E", "NE") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://mint.nalle.onuryildiz.dev/nft/";
    }

    function mint(address to) public onlyOwner returns (uint256) {
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId < MAX_SUPPLY);
        _tokenIdCounter.increment();
        _mint(to, tokenId);
        return tokenId;
    }


}

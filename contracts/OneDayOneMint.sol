// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OneDayOneMint is ERC721, Ownable {

    uint256 public totalSupply;
    uint256 public mintPrice;
    uint256 private _tokenId;
    string private _baseTokenURI;

    uint256 public NFTsPerDay = 1;

    //Mint starting and ending date in timestamp
    uint256 public mintStart;
    uint256 public mintEnd;

    // pausable
    bool public paused;

    //Set your token name inside ERC721() 
    constructor(uint256 _start, uint256 _end, uint256 _nftPrice) ERC721("Token", "TKN") {
        mintStart = _start;
        mintEnd = _end;
        mintPrice = _nftPrice * 10 ** 18;
    }

    //set URI
    function _baseURI() internal pure override returns (string memory) {
        return '';
    }

    modifier MintAllowance() {
        require(msg.value == mintPrice, 'Not enough ether');
        require(block.timestamp < mintEnd, 'Minting date has ended');

        int256 dayCount = int256(block.timestamp) - int256(mintStart) + (int256(NFTsPerDay) - 1);
        int256 SupplyInSeconds = int256(totalSupply) * 24 * 60 * 60;

        if( dayCount > SupplyInSeconds && dayCount > 0 ){
            _;
        } else {
            revert('Not Available');
        }
    }

    function safeMint() public payable MintAllowance {
        require(!paused, "Minting is paused");
        
        _safeMint(msg.sender, _tokenId);
        totalSupply += 1;
        _tokenId += 1;
    }

    function setMintStart(uint256 _startDate) public onlyOwner {
        mintStart = _startDate;
    }

    function setMintEnd(uint256 _endDate) public onlyOwner {
        mintEnd = _endDate;
    }

    function setPrice(uint256 _nftPrice) public onlyOwner {
        mintPrice = _nftPrice * 10 ** 18;
    }

    function setNFTsPerDay(uint256 _NFTsPerDay) public onlyOwner {
        NFTsPerDay = _NFTsPerDay;
    }

    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    //Pausable functions
    function pauseMint() public onlyOwner {
        paused = true;
    }

    function unpauseMint() public onlyOwner {
        paused = false;
    }
}

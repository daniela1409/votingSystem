// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract VotingSystem {

    //Definición de variables
    uint nextId;
    address public enableAddress;
    uint public votesEndTime;
    address[] addressArray = [
        0x20feca641901BE6Df9215A0858a21012f1ea37Dd,
        0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,
        0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db,
        0xCfEB869F69431e42cdB54A4F4f105C19C080A601,
        0xdAC17F958D2ee523a2206206994597C13D831ec7,
        0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1,
        0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0,
        0xFABB0ac9d68B0B445fB7357272Ff202C5651694a,
        0x0123456789012345678901234567890123456789
    ];

    struct Proposal{
        uint id;
        string name;
        uint votes;
    }

    Proposal[] proposals;
    address[] addressesThatVoted;

    //Constructor que inicializa el dirección permitida para crear las propuestas y el timestamp
    constructor() {
        enableAddress = 0xb3561860138E1636d69847E1F5250Cb082eD6Fa9;
        uint threeDaysInSeconds= 3 * 24 * 60 * 60;
        votesEndTime = block.timestamp + threeDaysInSeconds;
    }

    //Función para crear propuestas
    function createProposal(string memory proposalName, address add) public {
        if(enableAddress == add){
            proposals.push(Proposal(nextId, proposalName, 0));
            nextId++;
        }else{
            revert('Proposal not found');
        }
    }

    //Función para encontrar index de una propuesta
    function findIndexByNameInProposals(string memory proposalName) internal  view returns (uint){
        for(uint i = 0; i < proposals.length; i++){
            if(keccak256(abi.encodePacked(proposals[i].name)) == keccak256(abi.encodePacked(proposalName))){
                return i;
            }
        }
        revert('Proposal not found');
    }

    //Función que validad que la dirección que votó, esté dentro de las direcciones permitidas y no haya votado aún
    function findIndexByNameInAddressArray(address _address) internal view returns (uint){
        
        bool isAddress = false;
        for (uint j = 0; j < addressesThatVoted.length; j++){
            if((addressesThatVoted[j] == _address)){
                isAddress = true;
            }
        }
        if(!isAddress){
            for (uint i = 0; i < addressArray.length; i++){
                if((addressArray[i] == _address)){
                    return i;
                }
            }
        }
        revert('address not allowed');
    }

    //Función que retorna el index donde está una propuesta
    function findIndex(uint _id) internal view returns (uint){
        for(uint i = 0; i < proposals.length; i++){
            if(proposals[i].id ==_id){
                return i;
            }
        }
        revert('Index not found');
    }

    //Función que permite votar. El evento permite evidenciar en los logs del contrato, cuándo no se efectuó un voto
    function vote(string memory proposalName, address _address)public returns (uint){
        if(votesEndTime > block.timestamp){
            findIndexByNameInAddressArray(_address);
            uint index = findIndexByNameInProposals(proposalName);
            proposals[index].votes = proposals[index].votes + 1;
            addressesThatVoted.push(_address);
            return 1;
        }else{
            emit VotingError("Voting was closed");
            return 0;
        }
    }

    //Obtener nombre y número de votos de una propuesta
    function getProposalsWithIndex(uint _id) public view returns (string memory, uint){
        uint index = findIndex(_id);
        return (proposals[index].name, proposals[index].votes);
    } 

    //Función para saber si las votaciones están abiertas o no
    function isATime() public view returns (string memory){
        if(votesEndTime > block.timestamp){
            return "Alloled";
        }else {
            return "Non alloled";
        }
    }

    //Función que permite saber cuántas propuestas hay
    function getTotalProposals() public view returns(uint){
        return proposals.length;
    }

    event VotingError(string message);
}

pragma solidity ^0.7.0;

contract EsimManagementHyperstructure {
    // Store struct definition
    struct Esim {
        uint id;
        string hardwareId;
        string esimId;
    }

    // Mapping from esim id to esim struct
    mapping(uint => Esim) private esims;

    // Array of all esim IDs
    uint[] private esimIds;

    // Registers a new esim
    function newRegistration(uint _id, string memory _hardwareId, string memory _esimId) private {
        // Create a new esim
        Esim memory newEsim = Esim(_id, _hardwareId, _esimId);

        // Add the new esim to the mapping
        esims[_id] = newEsim;

        // Add the esim id to the array of all esim IDs
        esimIds.push(_id);
    }

    // Edits an existing esim registration
    function editRegistration(uint _id, string memory _hardwareId, string memory _esimId) private {
        // Retrieve the esim from the mapping
        Esim storage esim = esims[_id];

        // Update the esim's hardwareId and esimId
        esim.hardwareId = _hardwareId;
        esim.esimId = _esimId;
    }

    // Returns the esimIds array
    function getEsimIds() public view returns (uint[] memory) {
        return esimIds;
    }

    // Returns an esim by esimID
    function getEsim(uint _id) public view returns (uint id, string memory hardwareId, string memory esimId) {
        // Retrieve the esim from the mapping
        Esim storage esim = esims[_id];

        // Return the esim's id, hardwareId, and esimId
        return (esim.id, esim.hardwareId, esim.esimId);
    }

    // Searches the esimIds array by hardwareId and esimId
    // On-chain searches are computationally heavy and should be avoided
    function searchEsimIds(string memory _hardwareId, string memory _esimId) public view returns (uint[] memory) {
        // Create an empty array to store the matching esim IDs
        uint[] memory matchingEsimIds;

        // Iterate through the array of all esim IDs
        for (uint i = 0; i < esimIds.length; i++) {
            // Retrieve the esim from the mapping
            Esim storage esim = esims[esimIds[i]];

            // Check if the esim's hardwareId or esimId matches the search criteria
            if (esim.hardwareId == _hardwareId || esim.esimId == _esimId) {
                // Add the esim's id to the matchingEsimsIds array
                matchingEsimIds.push(esim.id);
            }
        }

        // Return the array of matching esim IDs
        return matchingEsimIds;
    }

    function deleteRegistration(uint _id) private {
        // Retrieve the esim from the mapping
        Esim storage esim = esims[_id];

        // Delete the esim from the mapping
        delete esims[_id];

        // Remove the esim id from the array of all esim IDs
        for (uint i = 0; i < esimIds.length; i++) {
            if (esimIds[i] == _id) {
                esimIds[i] = esimIds[esimIds.length - 1];
                delete esimIds[esimIds.length - 1];
                esimIds.length--;
                break;
            }
        }
    }
}
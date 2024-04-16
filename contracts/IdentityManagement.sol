// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract IdentityManagement {
    
    address public contractOwner;

    constructor() {
        contractOwner = msg.sender;
    }

    struct UserInfo {
        string fullName;
        string emailID;
        uint256 mobileNo;
    }
    
    struct UserDL {
        string DL_No;
        string DL_Name;
        string DL_DOB;
        bytes DL_Hash;
        string DL_Address;
    }

    struct DLRequest {
        string requestedBy;
        string DL_No;
        string DL_Name;
        string DL_DOB;
        bytes DL_Hash;
        string DL_Address;
        uint8 DL_OverAll_Status;
    }

    mapping(address => UserInfo[]) public userMap;
    mapping(address => UserDL[]) public userDLMap;
    mapping(address => DLRequest[]) public DLRequestMap;
    
    modifier onlyOwner() {
        require(msg.sender == contractOwner, "Only contract owner can call this function");
        _;
    }

    function addUser(string memory _fullName, string memory _emailID, uint256 _mobileNo) external {
        userMap[msg.sender].push(UserInfo(_fullName, _emailID, _mobileNo));
    }

    function addUserDL(string memory _DL_No, string memory _DL_Name, string memory _DL_DOB, bytes memory _DL_Hash, string memory _DL_Address) external {
        userDLMap[msg.sender].push(UserDL(_DL_No, _DL_Name, _DL_DOB, _DL_Hash, _DL_Address));
    }

    function addDLRequest(string memory _requestedBy, string memory _DL_No, string memory _DL_Name, string memory _DL_DOB, bytes memory _DL_Hash, string memory _DL_Address, uint8 _DL_OverAll_Status) external {
        DLRequestMap[msg.sender].push(DLRequest(_requestedBy, _DL_No, _DL_Name, _DL_DOB, _DL_Hash, _DL_Address, _DL_OverAll_Status));
    }

    function viewDLRequestLength() external view returns (uint256) {
        return DLRequestMap[msg.sender].length;
    }

    function viewDLRequestHeader(uint256 _requestIndex) external view returns (string memory, uint8) {
        require(_requestIndex < DLRequestMap[msg.sender].length, "Invalid request index");
        DLRequest memory thisDLRequest = DLRequestMap[msg.sender][_requestIndex];
        return (thisDLRequest.requestedBy, thisDLRequest.DL_OverAll_Status);
    }
    
    function viewDLRequestDetail(uint256 _requestIndex) external view returns (string memory, string memory, string memory, string memory, bytes memory, string memory, uint8) {
        require(_requestIndex < DLRequestMap[msg.sender].length, "Invalid request index");
        DLRequest memory thisDLRequest = DLRequestMap[msg.sender][_requestIndex];
        return (thisDLRequest.requestedBy, thisDLRequest.DL_No, thisDLRequest.DL_Name, thisDLRequest.DL_DOB, thisDLRequest.DL_Hash, thisDLRequest.DL_Address, thisDLRequest.DL_OverAll_Status);
    }

    function updateRequestStatus(uint256 _requestIndex, string memory _DL_No, string memory _DL_Name, string memory _DL_DOB, bytes memory _DL_Hash, string memory _DL_Address, uint8 _DL_OverAll_Status) external {
        require(_requestIndex < DLRequestMap[msg.sender].length, "Invalid request index");
        DLRequestMap[msg.sender][_requestIndex].DL_No = _DL_No;
        DLRequestMap[msg.sender][_requestIndex].DL_Name = _DL_Name;
        DLRequestMap[msg.sender][_requestIndex].DL_DOB = _DL_DOB;
        DLRequestMap[msg.sender][_requestIndex].DL_Hash = _DL_Hash;
        DLRequestMap[msg.sender][_requestIndex].DL_Address = _DL_Address;
        DLRequestMap[msg.sender][_requestIndex].DL_OverAll_Status = _DL_OverAll_Status;
    }

    function viewUser(uint256 _userIndex) external view returns (string memory, string memory, uint256) {
        require(_userIndex < userMap[msg.sender].length, "Invalid user index");
        UserInfo memory thisUser = userMap[msg.sender][_userIndex];
        return (thisUser.fullName, thisUser.emailID, thisUser.mobileNo);
    }

    function viewUserDL(uint256 _requestIndex) external view returns (string memory, string memory, string memory, string memory,string memory,string memory, bytes memory,bytes memory,string memory,string memory) {
    require(_requestIndex < userDLMap[msg.sender].length, "Invalid request index");
    UserDL memory thisUserDL = userDLMap[msg.sender][_requestIndex];
    DLRequest memory thisDLRequest = DLRequestMap[msg.sender][_requestIndex];
    return (thisDLRequest.DL_No, thisUserDL.DL_No, thisDLRequest.DL_Name, thisUserDL.DL_Name, thisDLRequest.DL_DOB, thisUserDL.DL_DOB, thisDLRequest.DL_Hash, thisUserDL.DL_Hash, thisDLRequest.DL_Address, thisUserDL.DL_Address);
}
}
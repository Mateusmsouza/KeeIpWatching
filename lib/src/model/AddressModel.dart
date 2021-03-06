class AddressModel {
  String publicAddress = "0.0.0.0";
  String privateAddress = "0.0.0.0";

  updatePublicAddress(String publicAddress){
    this.publicAddress = publicAddress;
  }

  updatePrivateAddress(String privateAddress){
    this.privateAddress = privateAddress;
  }
}
class Product {
  String? pName;
  String? pPrice;
  String? pLocation;
  String? pDescription;
  String? pCategory;
  String? pId;
  int? pQuantity;
  Product(
      {
      this.pQuantity,
      this.pId,
      this.pName,
      this.pCategory,
      this.pDescription,
      this.pLocation,
      this.pPrice});
}
class Orderr {
  String? documentId;
  int? totallPrice;
  String? address;
  Orderr({this.totallPrice, this.address, this.documentId});
}

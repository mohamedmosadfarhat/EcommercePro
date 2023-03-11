//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:buyit/constants.dart';
import 'package:buyit/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store{
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
  
  addproduct(Product product)
  {
 _firebaseFirestore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductLocation: product.pLocation,
      kProductCategory: product.pCategory,
      kProductPrice: product.pPrice
    });
// Stream<QuerySnapshot> loadProducts() {
//     return _firebaseFirestore.collection(kProductsCollection).snapshots();
//   }
  //  loadproducts(){
  //     _firebaseFirestore.collection(kProductsCollection).get;
     
  //  }


  }
Stream<QuerySnapshot> loadProducts() {
     return _firebaseFirestore.collection(kProductsCollection).snapshots();
   }

 deleteProduct(documentId) {
    _firebaseFirestore.collection(kProductsCollection).doc(documentId).delete();
  }
   Stream<QuerySnapshot> loadOrders() {
    return _firebaseFirestore.collection(kOrders).snapshots();
  }
  Stream<QuerySnapshot> loadOrderDetails(documentId) {
    return _firebaseFirestore
        .collection(kOrders)
        .doc(documentId)
        .collection(kOrderDetails)
        .snapshots();
  }
     
  editProduct(data, documentId) {
    _firebaseFirestore
        .collection(kProductsCollection)
        .doc(documentId).update(data);
        //.updateData(data);
  }

  storeOrders(data, List<Product> products) {
    var documentRef = _firebaseFirestore.collection(kOrders).doc();
    documentRef.set(data);
    for (var product in products) {
      documentRef.collection(kOrderDetails).doc().set({
        kProductName: product.pName,
        kProductPrice: product.pPrice,
        kProductQuantity: product.pQuantity,
        kProductLocation: product.pLocation,
        kProductCategory: product.pCategory
      });
    }
  }


  
}
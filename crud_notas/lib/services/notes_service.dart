
import 'package:crud_notas/models/notes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:crud_notas/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier{
  
  final String _baseUrl = 'https://notasv2-27921-default-rtdb.firebaseio.com/';
  final List<Notes> notes =[];
  late Notes? selectedNotes;

  final storage = new FlutterSecureStorage();

  bool isLoading = true;
  bool isSaving = false;

  NotessService(){
    this.loadNotes();
  }



Future<List<Notes>> loadNotes() async{

  this.isLoading = true;
  notifyListeners();

  final url = Uri.https(_baseUrl, 'notes.json',{
    'auth': await storage.read(key: 'token') ?? ''
  });
  final resp = await http.get(url);

  final Map<String, dynamic> productsMap = json.decode(resp.body);

  productsMap.forEach((key, value) {
  final tempNote = Notes.fromMap(value!);
  this.notes.add(tempNote);    

  }
);

this.isLoading = false;
notifyListeners();

return this.notes;

}

Future saveOrCreateProduct( Note product) async{

  isSaving= true;
  notifyListeners();

  if( product.id == null){

    await this.createProduct(product);
  } else{

    await this.updateProduct(product);

  }

  isSaving= false;
  notifyListeners();

}

Future<String> updateProduct (Product product) async {

 final url = Uri.https(_baseUrl, 'products/${ product.id}.json');
 final resp = await http.put(url, body:product.toJson() );
 final decodedData = resp.body;


  final index = this.products.indexWhere((element) => element.id ==product.id);
  this.products[index] = product;

return product.id!;
}


Future<String> createProduct (Product product) async {

 final url = Uri.https(_baseUrl, 'products.json');
 final resp = await http.post(url, body:product.toJson() );
 final decodedData = json.decode(resp.body);

product.id = decodedData['name'];
  // this.products.add(product);

return product.id!;
 }

}
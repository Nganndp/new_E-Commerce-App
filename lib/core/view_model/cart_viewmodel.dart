import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/services/Database/cart_database.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{

  ValueNotifier<bool> get loading => _loading;
  
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  CartViewModel(){
    getAllProduct();
  }
  getAllProduct() async{
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();

    //print(_cartProductModel.length);

    _loading.value = false;
    getTotalPrice();

    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    if(_cartProductModel.length == 0)
      {
        var dbHelper = CartDatabaseHelper.db;
        await dbHelper.insert(cartProductModel);
      }
    else {
      for (int i = 0; i < _cartProductModel.length; i ++) {
        if (_cartProductModel[i].productId == cartProductModel.productId) {
          return;
        }
        else {
          var dbHelper = CartDatabaseHelper.db;
          await dbHelper.insert(cartProductModel);
        }
      }
    }
    update();
  }
  getTotalPrice(){
    for(int i = 0; i < _cartProductModel.length; i++)
      {
        _totalPrice += (double.parse(_cartProductModel[i].price)
            * _cartProductModel[i].quantity);
        print(_totalPrice);
        update();
      }
  }
}
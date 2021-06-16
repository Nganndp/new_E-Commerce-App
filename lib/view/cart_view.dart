import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/cart_viewmodel.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  List<String> names = <String>[
    'hoangtuan',
    'hoangtuan',
    'hoangtuan',
    'hoangtuan',
    'hoangtuan',
  ];
  List<String> images = <String>[
    'assets/images/product.jpg',
    'assets/images/product.jpg',
    'assets/images/product.jpg',
    'assets/images/product.jpg',
    'assets/images/product.jpg',
  ];
  List<int> prices = <int>[100, 200, 300, 400, 500];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder:(controller) => Container(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                    height: 140,
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          child: Image.network(
                            controller.cartProductModel[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, right: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller.cartProductModel[index].name,
                                fontSize: 20,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              CustomText(
                                color: primaryColor,
                                text: controller.cartProductModel[index].price.toString() + ' \VND',
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                  width: 140,
                                  color: Colors.grey.shade200,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        alignment: Alignment.center,
                                        fontSize: 20,
                                        color: Colors.black,
                                        text: '1',
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Icon(
                                          Icons.minimize,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )
                      ],
                    ));
              },
              itemCount: controller.cartProductModel.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
            ),
          ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: 'TOTAL',
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: '200000' + ' \VND',
                    fontSize: 18,
                    color: primaryColor,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: CustomButton(
                  onPress: () {},
                  text: 'CHECK OUT',
                ),
              )
            ],
          ),
        )
      ],
    ));
    }
}

import 'package:ecommerce_app/model/checkout_viewmodel.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder: (controller) => Form(
        key: controller.formState,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:40,),
                CustomText(
                  text: 'Billing address is the same as delivery address',
                  fontSize: 20,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  onSave: (value){
                    controller.street1 = value;
                  },
                  validator: (String value)
                  {
                    if(value.isEmpty)
                      {
                        return 'You must write your street';
                      }
                    },
                  text: 'Steet 1',
                  hint: '16, Ngo Quyen',

                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  onSave: (value){
                    controller.street2 = value;
                  },
                  validator: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return 'You must write your street 2';
                    }
                  },
                  text: 'Steet 2',
                  hint: 'Floor 5, Room 2, Sunshine apartment',

                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  onSave: (value){
                    controller.street1 = value;
                  },
                  validator: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return 'You must write your city';
                    }
                  },
                  text: 'City',
                  hint: 'Bien Hoa city',

                ),
                Container(
                  width: Get.width ,
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CustomTextFormField(
                            onSave: (value){
                              controller.state = value;
                            },
                            validator: (String value)
                            {
                              if(value.isEmpty)
                              {
                                return 'You must write your state';
                              }
                            },
                             text: 'State',
                              hint: 'Dong Nai',
                          ),
                          ),
                      ),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CustomTextFormField(
                              onSave: (value){
                                controller.country = value;
                              },
                              validator: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'You must write your country';
                                }
                              },
                              text: 'Country',
                              hint: 'Viet Nam',
                            ),
                          ),
                          ),
                        ],
                      ),
                ),
                ],
                  ),
          )
              )
      ),
      )
    );
  }
}
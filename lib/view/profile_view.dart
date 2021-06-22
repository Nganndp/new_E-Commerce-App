import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
     builder: (controller)=>controller.loading.value ?
         Center(
            child: CircularProgressIndicator(),
         )
     : Scaffold(
       body: Container(
       child: SingleChildScrollView(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:120,
                    height: 120,
                      decoration: BoxDecoration(
                      color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        image: DecorationImage(
                          image: controller.userModel == null ?
                              AssetImage('assets/images/avatar.png')
                              : controller.userModel.pic ==
                            'default'
                            ? AssetImage('assets/images/avatar.png')
                            : NetworkImage(
                          controller.userModel.pic,
                        ),
                          fit: BoxFit.fill,
                        ),
                      ),
                  ),
                  Column(
                      children:[
                        CustomText(
                          text: controller.userModel.name,
                          color: Colors.black,
                          fontSize: 32,
                        ),
                        CustomText(
                          text: controller.userModel.email,
                          color: Colors.black,
                          fontSize: 24,
                        )
                      ]
                  )
                ],
              )
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: FlatButton(
                onPressed: ()
                {

                },
                child: ListTile(
                  title: CustomText(
                    text: 'Edit Profile',
                  ),
                  leading: Image.asset
                    ('assets/menu_icon/icon_edit_profile.png'
                  ),
                  trailing:  Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                ),
              ),
            ), //editprofile
            SizedBox(
              height: 20,
            ),
            Container(
              child: FlatButton(
                onPressed: ()
                {

                },
                child: ListTile(
                  title: CustomText(
                    text: 'Shipping Address',
                  ),
                  leading: Image.asset
                    ('assets/menu_icon/icon_location.png'
                  ),
                  trailing:  Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                ),
              ),
            ), //address
            SizedBox(
              height: 20,
            ),
            Container(
              child: FlatButton(
                onPressed: ()
                {

                },
                child: ListTile(
                  title: CustomText(
                    text: 'Order History',
                  ),
                  leading: Image.asset
                    ('assets/menu_icon/icon_order.png'
                  ),
                  trailing:  Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                ),
              ),
            ), //orderhistory
            SizedBox(
              height: 20,
            ),
            Container(
              child: FlatButton(
                onPressed: ()
                {

                },
                child: ListTile(
                  title: CustomText(
                    text: 'Cards',
                  ),
                  leading: Image.asset
                    ('assets/menu_icon/icon_payment.png'
                  ),
                  trailing:  Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                ),
              ),
            ), //cardpayment
            SizedBox(
              height: 20,
            ),
            Container(
              child: FlatButton(
                onPressed: ()
                {

                },
                child: ListTile(
                  title: CustomText(
                    text: 'Notifications',
                  ),
                  leading: Image.asset
                    ('assets/menu_icon/icon_notification.png'
                  ),
                  trailing:  Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                ),
              ),
            ), //notifications
            SizedBox(
              height: 20,
            ),
            Container(
              child: FlatButton(
                onPressed: ()
                {
                  controller.signOut();
                  Get.offAll(LoginView());
                },
                child: ListTile(
                  title: CustomText(
                    text: 'Log Out',
                  ),
                  leading: Image.asset
                    ('assets/menu_icon/icon_exit.png'
                  ),
                  trailing:  Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                ),
              ),
            ), //logout
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),),
     ),
    );
  }
}

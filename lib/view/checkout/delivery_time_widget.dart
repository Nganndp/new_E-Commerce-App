import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/helper/enum.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
  }
  class _DeliveryTimeState extends State<DeliveryTime>
  {
  Delivery delivery = Delivery.StandardDelivery;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 50,),
          RadioListTile<Delivery>(value: Delivery.StandardDelivery,
              groupValue: null,
              onChanged: (Delivery value){
            setState(() {
              delivery = value;
            });
              },
            title: CustomText(
              text:'Standard Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\nOrder will be delivered between 3 ~ 5 days',
           fontSize: 18,
            ),
            activeColor: primaryColor,
          ),//standard
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(value: Delivery.NextDayDelivery,
            groupValue: null,
            onChanged: (Delivery value){
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text:'Next Day Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\nPlace your Order before 6pm and your item will be deliveried',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),//nextday
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(value: Delivery.NominatedDelivery,
            groupValue: null,
            onChanged: (Delivery value){
              setState(() {
                delivery = value;
              });
            },
            title: CustomText(
              text:'Nominated Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\nPick a day on the calendar, and enjoy your safe and sound delivery',
              fontSize: 18,
            ),
            activeColor: primaryColor,
          ),//nominated
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
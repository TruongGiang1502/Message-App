import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class OtpInputField extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  final bool isFinalValue;
  const OtpInputField({super.key, required this.controller, required this.size, required this.isFinalValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height*0.07,
      width: size.width*0.15,
      child: TextField(
        //maxLength: 1,
        controller: controller,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if(value.length == 1){
            if(!isFinalValue){
              FocusScope.of(context).nextFocus();
            }
            else{

            }
          }
          else {
            FocusScope.of(context).previousFocus();
          }   
        } ,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputField extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  final bool isFinalValue;
  const OtpInputField({super.key, required this.size, required this.isFinalValue, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height*0.07,
      width: size.width*0.15,
      child: TextField(
        showCursor: false,
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
          if(value.length == 1 && !isFinalValue){
              FocusScope.of(context).nextFocus();     
          }
        } ,
      ),
    );
  }
}
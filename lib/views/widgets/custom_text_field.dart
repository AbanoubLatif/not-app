import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
     this.hintText,
    this.maxLines=1,
    this.onSaved, this.onChanged, this.controller});

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value?.isEmpty??true){
          return 'Field is required';
        }
        else{
          return null;
        }
      },
      controller: controller,
      onChanged:onChanged ,
      onSaved: onSaved,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: buildBorder(),
        border: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color?? Colors.white,
        ),
      );
  }
}

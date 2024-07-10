import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
   CustomButton({super.key,
     required this.text,
     this.onTap,
     this.isLoading=false});

  final String text;
  void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kPrimaryColor
        ),
        width: MediaQuery.of(context).size.width,
        child: Center(child:isLoading? const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: Colors.black,
            )): Text(text,style:
        const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        )
        ),
      ),
    );
  }
}

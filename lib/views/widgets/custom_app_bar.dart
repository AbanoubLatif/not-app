import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.icon,this.onPressed});
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(text,
          style: const TextStyle(fontSize: 24),
        ),
        const Spacer(),
       CustomIcon(icon:icon,onPressed: onPressed,),
      ],
    );
  }
}

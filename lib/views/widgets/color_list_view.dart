import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/add_note_cubit.dart';

import '../../constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive?  CircleAvatar(
      radius: 30,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 25,
      ),
    )
        : CircleAvatar(
      backgroundColor: color,
      radius: 30,
    );
  }
}
class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
   int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: kColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal:6),
              child: GestureDetector(
                onTap: (){
                  currentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color=kColors[index];
                  setState(() {

                  });
                },
                child: ColorItem(
                  color: kColors[index],
                  isActive: currentIndex== index,
                ),
              ),
            );
          }),
    );
  }
}
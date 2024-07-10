import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/notes_cubit/notes_cubit.dart';

import 'widgets/custom_app_bar.dart';
import 'widgets/custom_text_field.dart';

class EditNoteBodyView extends StatefulWidget {
  const EditNoteBodyView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteBodyView> createState() => _EditNoteBodyViewState();
}

class _EditNoteBodyViewState extends State<EditNoteBodyView> {
  late TextEditingController titleController;
  late TextEditingController supTitleController;
  String? title,supTitle;
  final GlobalKey<FormState>formKey=GlobalKey();
  AutovalidateMode autoValidateMode=AutovalidateMode.disabled;
  @override
  void initState(){
     titleController=TextEditingController(text: widget.note.title);
     supTitleController=TextEditingController(text: widget.note.subtitle);

    super.initState();
  }
  @override
  void dispose(){
    titleController.dispose();
    supTitleController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            CustomAppBar(
              onPressed: (){
                if (formKey.currentState!.validate()) {
                  widget.note.title = titleController.text;
                  widget.note.subtitle=supTitleController.text;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                }
               else{
                 autoValidateMode= AutovalidateMode.always;
                }
              },
              text: 'Edit Notes',
              icon:Icons.check,),
            const SizedBox(height: 20,),
            CustomTextField(
              controller: titleController,
              onChanged: (value){
                title=value;
              },
            ),
            const SizedBox(height: 20,),
            CustomTextField(
              controller: supTitleController,
              onChanged: (value){
                supTitle=value;
              },
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}

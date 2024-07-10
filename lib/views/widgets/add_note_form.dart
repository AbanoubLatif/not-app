import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/color_list_view.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';
import 'custom_button.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState>formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title / العنوان',
          ),
          const SizedBox(height: 20,),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'Content / المحتوى',
            maxLines: 4,
          ),
          const SizedBox(height: 30,),
          const ColorListView(),
          const SizedBox(height: 30,),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(text: 'Add',
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                    DateFormat('dd-M-yyyy').format(currentDate);
                    var noteModel = NoteModel(title: title!,
                        subtitle: subTitle!,
                        date:formattedCurrentDate,
                        color: Colors.blue.value

                    );

                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  }
                  else {
                    autoValidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}



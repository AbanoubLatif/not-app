import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomModalSheet extends StatelessWidget {
  const AddNoteBottomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }

          if (state is AddNoteFaile) {
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding:  EdgeInsets.only(right: 16,left: 16,top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: const SingleChildScrollView(
                    child: AddNoteForm()),
              ));
        },
      ),
    );
  }
}


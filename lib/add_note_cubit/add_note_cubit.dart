import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color? color= const Color(0xff2C3333);
  addNote(NoteModel note) async{
    note.color=color!.value;
    try {
      emit(AddNoteLoading());

      var notesBox= Hive.box<NoteModel>(kNotesBox);

      await notesBox.add(note);
      emit(AddNoteSuccess());
    }  catch (e) {
      emit(AddNoteFaile(e.toString()));
    }
  }

}

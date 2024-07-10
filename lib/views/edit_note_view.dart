import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

import 'edit_note_body_view.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditNoteBodyView(
        note: note,
      ),
    );
  }
}

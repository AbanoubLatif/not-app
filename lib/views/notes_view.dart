import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/add_note_bottom_modal_sheet.dart';
import 'notes_body_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesBodyView(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder: (context) {
          return const AddNoteBottomModalSheet();
        });
      },
        child: const Icon(Icons.add),
      ),
    );
  }
}

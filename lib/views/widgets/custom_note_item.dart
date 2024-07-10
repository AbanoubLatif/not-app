import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/notes_cubit/notes_cubit.dart';
import '../edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)
        {
          return  EditNoteView(
            note: note,
          );
        }
        ));
      },
      child: Container(
        decoration:  BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,style: const TextStyle(fontSize: 26),),
              subtitle:  Text(note.subtitle,
                style: const TextStyle(fontSize: 18),),
              trailing: IconButton(onPressed: (){
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
                  icon: const Icon(Icons.delete_sharp)),
            ),
             Padding(
              padding: const EdgeInsets.only(right: 20,bottom: 20),
              child: Text(note.date,style: const TextStyle(fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }
}

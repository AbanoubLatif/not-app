import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/notes_cubit/notes_cubit.dart';
import 'package:note_app/views/widgets/notes_list_view.dart';
import 'widgets/custom_app_bar.dart';

class NotesBodyView extends StatefulWidget {
  const NotesBodyView({super.key});

  @override
  State<NotesBodyView> createState() => _NotesBodyViewState();
}

class _NotesBodyViewState extends State<NotesBodyView> {

  @override
  void initState()  {
   BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(text: 'Notes',icon:Icons.search,),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}


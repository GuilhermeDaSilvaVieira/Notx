import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notx/common/notes/bloc/note_bloc.dart';
import 'package:notx/common/notes/data/repository.dart';
import 'package:notx/common/notes/data/sqflite_connection.dart';
import 'package:notx/common/theme/app_theme.dart';
import 'package:notx/common/theme/bloc/theme_bloc.dart';
import 'package:notx/features/list/screens/list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// Note taking app
// Dark and light mode
// Support for all platforms, responsive UI
// Notes with title, content, delete button
// (List, View, Modify) Screen
// Feature wise development
// Sql database
// Bloc state management
// id
// title
// content
// created at
// last modified
// Save theme changes

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(prefs!)..add(ThemeLoad()),
        ),
        BlocProvider(
          create: (context) => NoteBloc(Repository())..add(GetAllNotesEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, state) {
          return MaterialApp(
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            home: const ListScreen(),
          );
        },
      ),
    );
  }
}

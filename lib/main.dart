import 'package:flutter/material.dart';
import 'package:to_do_list/pages/group_form_page/group_form_page.dart';
import 'package:to_do_list/pages/groups_page/groups_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/groups': (context) => const GroupsPage(),
        '/groups/form': (context) => const GroupFromPage(),
      },
      initialRoute: '/groups',
    );
  }
}

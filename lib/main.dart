import 'package:flutter/material.dart';
//Import pages
import 'pages/member.dart';
import 'pages/members.dart';

void main() {
  runApp(GDSCSite());
}

class GDSCSite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Club Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MembersPage(),
        '/profile': (context) => MemberPage(),
      },
    );
  }
}

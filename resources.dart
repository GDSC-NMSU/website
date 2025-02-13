import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void _openLink(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

Column buildResourceLinks() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Python', style: TextStyle(fontSize: 24)),
      GestureDetector(
        onTap: () => _openLink('https://wiki.python.org/moin/BeginnersGuide/Programmers'),
        child: Text(
          'Beginner\'s Guide',
          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
        ),
      ),
      SizedBox(height: 16),
      Text('Java', style: TextStyle(fontSize: 24)),
      GestureDetector(
        onTap: () => _openLink('https://docs.oracle.com/javase/tutorial/'),
        child: Text(
          'Oracle Tutorials',
          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
        ),
      ),
      SizedBox(height: 16),
      Text('Others', style: TextStyle(fontSize: 24)),
      GestureDetector(
        onTap: () => _openLink('https://youtube.com/playlist?list=PLh7i6AwsWt1s4GFfeBNsU8WiKhOPg1kix&si=1IdRVrxigAo3-SOV'),
        child: Text(
          'Flutter Tutorials',
          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
        ),
      ),
    ],
  );
}



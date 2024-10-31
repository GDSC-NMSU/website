import 'package:flutter/material.dart';
import 'theme.dart';
import 'custom_appbar.dart';

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web App',
      theme: AppTheme.getTheme(),
      home: HomePage(),
    );
  }
}*/

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customTextTheme = AppTheme.getCustomTextTheme();

     return Scaffold(
      appBar: CustomAppBar(
        title1: 'Google Developers',
        title2: 'Student Club',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Start aligning from the top
        children: <Widget>[
          // Row of buttons directly under the AppBar
          Row(
           // mainAxisAlignment: MainAxisAlignment.center, // Center the buttons horizontally
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action for HpmeButton
                },
                child: Text('Home', style: customTextTheme.pageTabs),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action for Members Button
                },
                child: Text('Members', style: customTextTheme.pageTabs),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action for Events Button
                },
                child: Text('Events', style: customTextTheme.pageTabs),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action for Discussion Button
                },
                child: Text('Discussion', style: customTextTheme.pageTabs),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action for Contact Button
                },
                child: Text('Contact', style: customTextTheme.pageTabs),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action for Resources Button
                },
                child: Text('Resources', style: customTextTheme.pageTabs),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title1;
  final String title2;

  const CustomAppBar({required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    final customTextTheme = AppTheme.getCustomTextTheme();

    return PreferredSize(
      preferredSize: Size.fromHeight(110.0), // Custom height
      child: AppBar(
        flexibleSpace: Container(
          padding: EdgeInsets.all(14.0), // Add padding if needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add your PNG image here
              Image.asset(
                'assets/badLogo.png', // Update to your image path
                height: 50, // Adjust height as needed
              ),
              SizedBox(width: 10), // Space between the image and titles
              // Use Column for two lines of text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: customTextTheme.clubName,
                  ),
                  Text(
                    title2,
                    style: customTextTheme.schoolName,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0); // Custom height
}

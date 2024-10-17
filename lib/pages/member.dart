import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MemberArguments args = ModalRoute.of(context)!.settings.arguments as MemberArguments;

    //Function to launch URLs for Resume/Project
    void launchURL(String url) async {
      final Uri uri = Uri.parse(url); //Convert string URL into Uri object
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception("Could not launch $url");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Display name
            Text('Name: ${args.name}', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            
            //Display "Resume" as a hyperlink
            GestureDetector(
              onTap: () => launchURL(args.resumeLink),
              child: const Text(
                'Resume',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
               ),
            ),
            const SizedBox(height: 10),
            
            //Display "Projects" as a hyperlink
            GestureDetector(
              onTap: () => {launchURL(args.projectLink), 
              print("Link tapped")},
              child: const Text(
                'Projects',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
               ),
            ),
            const SizedBox(height: 10),

            //Display image
            Image.network(
              args.imageUrl,
              fit:BoxFit.contain, //Make sure image fits on screen
            ),
          ],
        ),
      ),
    );
  }
}

// Arguments class for passing profile data
class MemberArguments {
  final String name;
  final String resumeLink;
  final String projectLink;
  final String imageUrl;

  MemberArguments(this.name, this.resumeLink, this.projectLink, this.imageUrl);
}

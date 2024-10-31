import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Google Developer Students Club',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle('Welcome to GDSC'), // Section title
              _buildAboutUsCard(),
              
              SizedBox(height: 40), // Spacing between sections
              
              _buildSectionTitle('Gallery'),
              _buildGalleryCard(),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF8C0B42),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(221, 247, 243, 243),
        ),
      ),
    );
  }

  Widget _buildAboutUsCard() {
    return Card(

      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0), // Rounded corners
      ),
      
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          gradient: LinearGradient(
            colors: [const Color.fromARGB(213, 77, 77, 77), const Color.fromARGB(255, 182, 185, 187)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Intro goes here....',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 20), // Spacing
              ElevatedButton(
                onPressed: () {
                  //navigate to the about us page later
          
                },
                child: Text('Learn More'), 
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryCard() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 400, // Adjust for optimal image height
              child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                //need to add images to the assets folder
                
              ].map((imagePath) {
                return Builder(
                builder: (BuildContext context) {
                  return _buildImageCard(imagePath);
                },
                );
              }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to create an image card
  Widget _buildImageCard(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      width: 160, // Fixed width for the card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), // Modern rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath), // Replace with your image
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

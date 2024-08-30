import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildImageCollectionCard('Collection 1', 'Description of Collection 1'),
          _buildImageCollectionCard('Collection 2', 'Description of Collection 2'),
          _buildImageCollectionCard('Collection 3', 'Description of Collection 3'),
        ],
      ),
    );
  }

  Widget _buildImageCollectionCard(String title, String description) {
    final PageController _pageController = PageController();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(description),
            ),
            SizedBox(
              height: 200,
              child: PageView(
                controller: _pageController,
                children: [
                  _buildImageCard('https://source.unsplash.com/random/300x200?nature', 'Slide 1 Title', 'Slide 1 Description'),
                  _buildImageCard('https://source.unsplash.com/random/300x200?city', 'Slide 2 Title', 'Slide 2 Description'),
                  _buildImageCard('https://source.unsplash.com/random/300x200?technology', 'Slide 3 Title', 'Slide 3 Description'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController, // PageController
                count: 3, // Number of slides
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.blue[900]!,
                  dotColor: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(String imageUrl, String slideTitle, String slideDescription) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            slideTitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(slideDescription),
        ],
      ),
    );
  }
}
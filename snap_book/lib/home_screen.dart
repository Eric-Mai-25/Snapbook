import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Feed'),
      ),
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
                children: [
                  _buildImageCard('https://via.placeholder.com/300', 'Slide 1 Title', 'Slide 1 Description'),
                  _buildImageCard('https://via.placeholder.com/300', 'Slide 2 Title', 'Slide 2 Description'),
                  _buildImageCard('https://via.placeholder.com/300', 'Slide 3 Title', 'Slide 3 Description'),
                ],
              ),
            ),
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
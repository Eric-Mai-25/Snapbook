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
        children: [
          _buildImageCollection('Collection 1'),
          _buildImageCollection('Collection 2'),
          _buildImageCollection('Collection 3'),
        ],
      ),
    );
  }

  Widget _buildImageCollection(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildImageCard('https://via.placeholder.com/150'),
                _buildImageCard('https://via.placeholder.com/150'),
                _buildImageCard('https://via.placeholder.com/150'),
                _buildImageCard('https://via.placeholder.com/150'),
                _buildImageCard('https://via.placeholder.com/150'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        child: Image.network(imageUrl),
      ),
    );
  }
}
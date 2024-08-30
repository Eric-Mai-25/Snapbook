import 'package:flutter/material.dart';

class SearchFeed extends StatelessWidget {
  const SearchFeed({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image paths
    final List<String> imagePaths = [
      'lib/pictures/example.png',
      'lib/pictures/example.png',
      'lib/pictures/example.png',
      'lib/pictures/example.png',
      'lib/pictures/example.png',
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: imagePaths.length, // Number of items to display
          itemBuilder: (context, index) {
            final randomHeight = (index % 3 + 1) * 100.0 + 50.0; // Random height for variety
            return Container(
              height: randomHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(imagePaths[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
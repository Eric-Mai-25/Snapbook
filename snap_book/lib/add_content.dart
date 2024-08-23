import 'package:flutter/material.dart';

class AddContent extends StatelessWidget {
  const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Content'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add logic to upload an image
              },
              child: const Text('Upload Image'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add logic to upload a video
              },
              child: const Text('Upload Video'),
            ),
          ],
        ),
      ),
    );
  }
}
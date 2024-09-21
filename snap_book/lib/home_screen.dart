import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<PageController> _pageControllers = List.generate(5, (_) => PageController());
  final List<int> _currentPages = List.generate(5, (_) => 0);

  @override
  void initState() {
    super.initState();
    // Adding listeners to each PageController
    for (int i = 0; i < _pageControllers.length; i++) {
      _pageControllers[i].addListener(() {
        setState(() {
          // Update the current page index based on the PageController's page
          _currentPages[i] = _pageControllers[i].page?.round() ?? 0;
        });
      });
    }
  }

  @override
  void dispose() {
    // Dispose all PageControllers
    for (var controller in _pageControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5, // Number of image collections
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Collection Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Subtitle
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'This is a description of the collection.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                // Image Carousel (One image per slide)
                SizedBox(
                  height: 300, // Adjust height as needed
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageControllers[index],
                        itemCount: 5, // Number of images in each collection
                        itemBuilder: (context, imageIndex) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'lib/pictures/example.png', // Use the example image
                                width: double.infinity,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      // Dots Indicator
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5, // Number of images
                              (dotIndex) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                height: 8.0,
                                width: 8.0,
                                decoration: BoxDecoration(
                                  color: _currentPages[index] == dotIndex ? Colors.blue : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
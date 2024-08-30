import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class AddContent extends StatefulWidget {
  const AddContent({super.key});

  @override
  _AddContentState createState() => _AddContentState();
}

class _AddContentState extends State<AddContent> {
  CameraController? _controller;
  late Future<void> _initializeControllerFuture;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isNotEmpty) {
        final firstCamera = cameras.first;

        _controller = CameraController(
          firstCamera,
          ResolutionPreset.high,
        );

        _initializeControllerFuture = _controller!.initialize();

        setState(() {
          _isCameraInitialized = true;
        });
      } else {
        // Handle the case where no cameras are found
        print('No cameras available');
        setState(() {
          _isCameraInitialized = false;
        });
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    // Dispose the camera controller only if it was initialized
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Content'),
      ),
      body: _isCameraInitialized
          ? FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller!);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          : const Center(
              child: Text(
                'No camera available',
                style: TextStyle(fontSize: 18),
              ),
            ),
      floatingActionButton: _isCameraInitialized
          ? FloatingActionButton(
              onPressed: () async {
                try {
                  await _initializeControllerFuture;
                  final image = await _controller!.takePicture();

                  if (!mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Picture saved to ${image.path}')),
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: const Icon(Icons.camera),
            )
          : null,
    );
  }
}
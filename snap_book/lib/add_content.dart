import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class AddContent extends StatefulWidget {
  const AddContent({super.key});

  @override
  _AddContentState createState() => _AddContentState();
}

class _AddContentState extends State<AddContent> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();

    if (!mounted) return;

    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: _isCameraInitialized
          ? FloatingActionButton(
              onPressed: () async {
                try {
                  await _initializeControllerFuture;
                  final image = await _controller.takePicture();

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
// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io'; // File handling
import 'package:path_provider/path_provider.dart'; // For app directory paths
import 'package:path/path.dart'; // For file path manipulation

class ScanScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

Future<List<CameraDescription>> getAvailableCameras() async {
  return await availableCameras();
}

class _CameraScreenState extends State<ScanScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    _cameras = await getAvailableCameras();
    _controller = CameraController(
      _cameras![0], // Use the first available camera
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller!.initialize();
    setState(() {});
  }


  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> takePicture() async {
    try {
      await _initializeControllerFuture;
      final XFile image = await _controller!.takePicture();
      // Handle the image (e.g., save/display)
      print('Picture taken: ${image.path}');

      // Get the application documents directory
      final Directory appDir = await getApplicationDocumentsDirectory();

      // Create a unique file name using the current timestamp
      final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Full path for the new image
      final String filePath = join(appDir.path, fileName);

      // Copy the image from the temp location to the app directory
      File savedImage = await File(image.path).copy(filePath);

      print('Image saved at: $filePath');
      
      // Optionally, you can display a confirmation message
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('Photo saved to $filePath'),
      // ));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Container(
                  height: 400,
                  child: CameraPreview(_controller!),
                ),
                ElevatedButton(
                  onPressed: takePicture,
                  child: Text('Take Picture'),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
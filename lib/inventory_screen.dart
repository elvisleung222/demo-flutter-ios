// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:io'; // For file handling
import 'package:path_provider/path_provider.dart'; // To get app storage paths


class InventoryScreen extends StatefulWidget {
  @override
  _InventryScreenState createState() => _InventryScreenState();
}


class _InventryScreenState extends State<InventoryScreen> {
  List<File> _photos = [];

  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  Future<void> _loadPhotos() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final List<FileSystemEntity> files = directory.listSync();

    List<File> photos = files
        .where((file) => file.path.endsWith('.jpg'))  // Assuming images are saved as .jpg
        .map((file) => File(file.path))
        .toList();

    setState(() {
      _photos = photos;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _photos.isEmpty
                  ? Center(child: Text('No photos found'))
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Display 3 photos per row
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: _photos.length,
                      itemBuilder: (context, index) {
                        return Image.file(
                          _photos[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
          )
        ],
      ),
    );
  }
}

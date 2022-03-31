import 'dart:io';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

String? _imagePath;

class AddMedia extends StatefulWidget {
  const AddMedia({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;

  @override
  _AddMediaState createState() => _AddMediaState();
}

class _AddMediaState extends State<AddMedia> {
  final _picker = ImagePicker();
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  Future<void> _openImagePicker(ImageSource source) async {
    XFile? pickedImage;
    XFile? capturedImage;
    bool picked = false;
    bool captured = false;
    if (source == ImageSource.gallery) {
      pickedImage = await _picker.pickImage(source: source);
      picked = true;
    }
    else {
      capturedImage = await _picker.pickImage(source: source);
      captured = true;
    }
      setState(() {
        if (picked) {
          _imagePath = pickedImage!.path;
        }
        if (captured) {
          _imagePath = capturedImage!.path;
        }
      });
  }

  @override
  void initState()  {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _openImagePicker(ImageSource.camera);
              },
              child: const Text("Take Picture"),
            ),
            ElevatedButton(
              onPressed: () {
                _openImagePicker(ImageSource.gallery);
              },
              child: const Text("Get Picture"),
            ),
            _imagePath != null
              ? Image.file(File(_imagePath!)) : const Text("Picture not set."),
          ],
        ),
      ),
    );
  }
}
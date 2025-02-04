import 'dart:developer';
import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class MyCamera extends StatefulWidget {
  const MyCamera({Key? key}) : super(key: key);

  @override
  State<MyCamera> createState() => _MyAppState();
}

class _MyAppState extends State<MyCamera> {
  File? _capturedImage;

  late FaceCameraController controller;

  @override
  void initState() {
    controller = FaceCameraController(
      autoCapture: true,
      defaultCameraLens: CameraLens.front,
      orientation: CameraOrientation.landscapeLeft,
      imageResolution: ImageResolution.low,
      onCapture: (File? image) {
        setState(() => _capturedImage = image);
      },
      onFaceDetected: (Face? face) {
        //Do something
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FaceCamera example app')),
        body: Builder(
          builder: (context) {
            if (_capturedImage != null) {
              return Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.file(
                      _capturedImage!,
                      width: double.maxFinite,
                      fit: BoxFit.fitWidth,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final size = await _capturedImage!.length();

                        final sizeInKB = size / 1024;
                        log('Size is $sizeInKB');
                        String? compressedImagePath =
                            await compressAndConvertImage(_capturedImage!.path);
                        log("Compressed image saved at: $compressedImagePath");
                        final sizeN = await File(compressedImagePath!).length();

                        final sizeInKBN = size / 1024;
                        log('Size is $sizeInKBN');
                        await controller.startImageStream();
                        setState(() => _capturedImage = null);
                      },
                      child: const Text(
                        'Capture Again',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              margin: EdgeInsets.only(bottom: 100, left: 20, right: 20),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: SmartFaceCamera(
                controller: controller,
                messageBuilder: (context, face) {
                  if (face == null) {
                    return _message('Place your face in the camera');
                  }
                  if (!face.wellPositioned) {
                    return _message('Center your face in the square');
                  }
                  return const SizedBox.shrink();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _message(String msg) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
    child: Text(
      msg,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        height: 1.5,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<String?> compressAndConvertImage(String inputPath) async {
    // Get the temporary directory to store the compressed image.
    final tempDir = await getTemporaryDirectory();
    final targetPath = p.join(tempDir.path, 'compressed_image.jpg');

    // Compress the image and convert to JPG.
    XFile? result = await FlutterImageCompress.compressAndGetFile(
      inputPath,
      targetPath,
      quality: 50, // Adjust the quality value (0-100) as needed.
      format: CompressFormat.jpeg, // Ensures the output is in JPG format.
    );

    if (result == null) {
      print("Image compression failed.");
      return null;
    }

    return result.path;
  }
}

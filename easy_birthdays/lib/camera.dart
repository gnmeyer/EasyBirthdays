import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraRoute extends StatefulWidget {
  @override
  _CameraRouteState createState() => _CameraRouteState();
}

class _CameraRouteState extends State<CameraRoute> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  late bool _isReady;

  @override
  void initState() {
    super.initState();
    _isReady = false;
    _initCameras();
  }

  Future<void> _initCameras() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.high);
    await _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      _isReady = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return Container();
    }
    return MaterialApp(
      home: Scaffold(
        body: CameraPreview(_controller),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.camera_alt),
        //   onPressed: () async {
        //     try {
        //       await _controller.takePicture();
        //     } catch (e) {
        //       print(e);
        //     }
        //   },
        // ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:desanimation/splashscreen.dart';
import 'package:shimmer/shimmer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splashscreen(),
    );
  }
}

class SkeletonScreen extends StatefulWidget {
  const SkeletonScreen({Key? key}) : super(key: key);

  @override
  _SkeletonScreenState createState() => _SkeletonScreenState();
}

class _SkeletonScreenState extends State<SkeletonScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  Future<void> _startLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _isLoading ? const SkeletonContent() : const MainContent(),
    );
  }
}

class SkeletonContent extends StatelessWidget {
  const SkeletonContent({Key? key}) : super(key: key);

  Widget _shimmerContainer({double width = double.infinity, double height = 20.0}) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50.0),
        Row(
          children: [
            _shimmerContainer(width: 100.0, height: 100.0),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerContainer(),
                  const SizedBox(height: 10.0),
                  _shimmerContainer(width: 150.0),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        _shimmerContainer(height: 200.0),
        const SizedBox(height: 20.0),
        _shimmerContainer(height: 200.0),
        const SizedBox(height: 20.0),
        _shimmerContainer(height: 200.0),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  Widget _imageContainer(String assetPath) {
    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50.0),
        Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/gabijan.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Franz Anthony Gabijan',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Car Collection',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        _imageContainer('assets/images/car1.jpg'),
        const SizedBox(height: 20.0),
        _imageContainer('assets/images/car2.jpg'),
        const SizedBox(height: 20.0),
        _imageContainer('assets/images/car3.jpg'),
      ],
    );
  }
}
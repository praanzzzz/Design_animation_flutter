import 'package:flutter/material.dart';
import 'package:desanimation/main.dart';
import 'package:flutter/services.dart';



class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}



class _splashscreenState extends State<splashscreen> 
  with SingleTickerProviderStateMixin{


  @override
  void initState(){
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 4), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SkeletonScreen()));
    });
  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values
    );
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo.jpg'),
      ),
    );
  }
}
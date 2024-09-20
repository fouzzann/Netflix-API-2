import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/widgets/models/screens/details_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LottieBuilder.asset('assets/netflix.json'),
      ),
    );
  }
}
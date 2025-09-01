// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lilac_test/features/home/home.dart';
import 'package:lilac_test/features/splash/sec_spl.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    splashDelay();
    super.initState();
  }

  void splashDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecSplash(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.fitHeight)),
    );
  }
}

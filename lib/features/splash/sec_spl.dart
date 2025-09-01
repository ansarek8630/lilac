// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lilac_test/features/splash/thr_spl.dart';

import '../../core/components/buttons.dart';

class SecSplash extends StatelessWidget {
  const SecSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/sec_bg.png"), fit: BoxFit.fitHeight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Catch Every \nBlockbuster \nWithout the Queue",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none, 
              fontSize: 33,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              fontFamily: "Poppins",
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThrSplash(),
                    ));
              },
              child: CustomButton(name: "next")),
        ],
      ),
    );
  }
}

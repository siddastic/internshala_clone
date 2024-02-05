import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshala_search/screens/search.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(1.seconds).then((value) {
      Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        toolbarHeight: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 9500),
                      begin: 1,
                      end: 0,
                    ),
                    ScaleEffect(
                      delay: Duration(milliseconds: 9500),
                      begin: Offset(1, 1),
                      end: Offset(0, 0),
                      curve: Curves.easeInOut,
                    ),
                  ],
                  child: Lottie.asset(
                    'assets/anims/plane.json',
                    frameRate: FrameRate.max,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: const Text.rich(
                      TextSpan(
                        text: "Intern",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        children: [
                          TextSpan(
                            text: "shala",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                        .animate(
                          delay: 9.seconds,
                        )
                        .fadeIn()
                        .scale(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

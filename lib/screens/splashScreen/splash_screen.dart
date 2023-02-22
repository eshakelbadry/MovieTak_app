import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../constants.dart';
import '../homeScreen/home_layout.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    Future.delayed(const Duration(seconds: 8), () {
      navigateToHome();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splashtwo.jpg',
            fit: BoxFit.fill,
            height: height,
            width: width,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.3),
              const Text(
                textAlign: TextAlign.center,
                'Welcome To MovieMate',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: pacificoFont,
                    fontSize: 25),
              ),
              const SizedBox(height: 15),
              AnimatedBuilder(
                  animation: slidingAnimation,
                  builder: (context, _) {
                    return SlideTransition(
                        position: slidingAnimation,
                        child: const Text(
                          textAlign: TextAlign.center,
                          'World Of Movies',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: poppinsFont,
                              fontSize: 20),
                        ));
                  }),
            ],
          ),
        ],
      ),
    );
  }

  void navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeLayOut(),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 15), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}

import 'dart:math';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Data/onboardin_data.dart';

import 'Auth/Login/login_page.dart';
import 'Auth/SignUp/signup_page.dart';
import '../Widgets/custom_button.dart';
// import 'package:task_management/utls/colors.dart';
import 'package:task_management/utls/textstyle.dart';

final listItem = PageData.genaratePageDataList();
PageController pageController = PageController(/* viewportFraction: 0.95 */);
var currentPageValue = 0.0;

class OnBordingPage extends StatefulWidget {
  const OnBordingPage({super.key});

  @override
  State<OnBordingPage> createState() => _OnBordingPageState();
}

class _OnBordingPageState extends State<OnBordingPage> {
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) => SizedBox(
                      width: double.infinity,
                      child: Stack(children: [
                        Positioned(
                          top: -184,
                          right: -104,
                          left: -133,
                          child: Transform.rotate(
                            angle: pi / 5,
                            child: Container(
                              height: 480,
                              width: 395,
                              decoration: BoxDecoration(
                                // boxShadow: ,
                                // color: listItem[index].color,
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                    image: AssetImage(
                                        listItem[index].imageUrl.toString()),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              child: HeadingText(
                                  'Create a Task and Assign it to Your Team Members'),
                            ),
                          ],
                        ),
                      ]),
                    ),
                itemCount: listItem.length),
          ),
          // ignore: unnecessary_new
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Align(
              alignment: Alignment.topLeft,
              child: DotsIndicator(
                dotsCount: listItem.length,
                position: currentPageValue.toInt(),
                decorator: DotsDecorator(
                  size: const Size.square(8),
                  activeSize: const Size(48.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: CustomButton(
              text: 'Sign Up',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: CustomButton(
              text: 'Login',
              color: Colors.transparent,
              borderColor: Colors.white,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/screen/Auth/SignUp/signup_page.dart';
import 'package:task_management/utls/colors.dart';
import 'package:task_management/Widgets/custom_button.dart';
import 'package:task_management/utls/textstyle.dart';

final TextEditingController emaliController = TextEditingController();
final TextEditingController passController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leadingWidth: 24,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          child: SvgPicture.asset(
              'assets/icons/cross.svg',height: 14,width: 14,
            ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                )),
            child: const Center(
              child:  TextFieldText(
                'Sing Up',
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
          ,SizedBox(width: 16)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              titleTextFiedl: 'Your Email Address',
              controller: emaliController,
              svgPicture: SvgPicture.asset(
                'assets/icons/mail.svg',
              ),
              hintText: 'Enter your email address',
              padding: const EdgeInsets.symmetric(horizontal: 18),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              obscureText: true,
              titleTextFiedl: 'Your Password',
              textInputType: TextInputType.visiblePassword,
              controller: passController,
              svgPicture: SvgPicture.asset(
                'assets/icons/pass.svg',
              ),
              hintText: 'Enter your password',
              padding: const EdgeInsets.symmetric(horizontal: 21.5),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Login',
              onTap: () {},
            ),
            const SizedBox(height: 41),
            Align(
              child: GestureDetector(
                onTap: () {},
                child: const TextFieldText(
                  'Forgot Your Password',
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 53),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.svgPicture,
    required this.hintText,
    required this.padding,
    this.textInputType,
    this.titleTextFiedl,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final SvgPicture? svgPicture;
  final String hintText;
  final EdgeInsetsGeometry padding;
  final TextInputType? textInputType;
  final String? titleTextFiedl;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldText(
          titleTextFiedl ?? 'ROY',
          color: kLabelTextColor,
        ),
        const SizedBox(height: 12),
        TextFormField(
          obscureText: obscureText,
          keyboardType: textInputType,
          style: myTextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: kButtonBackground)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: kTextFieldShap),
            ),
            hintText: hintText,
            hintStyle: myTextStyle(),
            prefixIcon: Padding(
              padding: padding,
              child: svgPicture,
            ),
            // prefixIconConstraints: BoxConstraints(maxHeight: 20),
          ),
        ),
      ],
    );
  }
}

bool isClick = true;

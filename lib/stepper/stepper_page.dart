import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_management/stepper/image_picker_model.dart';
// import 'package:task_management/screen/splash_page.dart';
// import 'package:task_management/screen/stepper_page2.dart';
import 'package:task_management/stepper/stepper_page2.dart';
import 'package:task_management/utls/colors.dart';
import '../screen/Auth/Login/login_page.dart';
import '../Widgets/custom_button.dart';
import '../utls/textstyle.dart';

final TextEditingController profileNameController = TextEditingController();
final TextEditingController profilePassNameController = TextEditingController();
String imagePath = '';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  final controller = Get.put(ChoseImage());
  // Future choseGallery() async {
  //   final ImagePicker _picker = ImagePicker();
  //   var pickImage = await _picker.pickImage(source: ImageSource.gallery);
  //   imagePath = pickImage!.path;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        // title: ,
        title: SvgPicture.asset('assets/icons/slider.svg'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: SvgPicture.asset(
              'assets/icons/arrow_chevron_left.svg',
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 16),
              Center(
                child: Text(
                  'Complete Your Profiles',
                  style: myTextStyle(
                      fontWeight: FontWeight.w700, color: kLabelTextColor),
                ),
              ),
              const SizedBox(height: 16),
              Obx(() => InkWell(
                    onTap: () {
                      controller.selectImage();
                    },
                    child: controller.imagePath.isEmpty
                        ? const Text('NO image')
                        : SizedBox(
                            height: 20,
                            width: 20,
                            child: Image(
                                image: FileImage(
                                    File(controller.imagePath.toString()))),
                          ),
                  )),
              const SizedBox(height: 4),
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                titleTextFiedl: 'Your Full Name',
                controller: profileNameController,
                svgPicture: SvgPicture.asset(
                  'assets/icons/profile.svg',
                ),
                hintText: 'Enter your full name',
                padding: const EdgeInsets.symmetric(horizontal: 18),
              ),
              const SizedBox(height: 6),
              CustomTextField(
                obscureText: true,
                titleTextFiedl: 'Your Password',
                textInputType: TextInputType.visiblePassword,
                controller: profilePassNameController,
                svgPicture: SvgPicture.asset(
                  'assets/icons/pass.svg',
                ),
                hintText: 'Enter your password',
                padding: const EdgeInsets.symmetric(horizontal: 21.5),
              ),
              const SizedBox(height: 6),
              CustomButton(
                text: 'Continue',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StepperPage2(),
                      ));
                },
              ),
              const SizedBox(height: 1),
              Align(
                child: GestureDetector(
                  onTap: () {},
                  child: const TextFieldText(
                    'Forgot Your Password',
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }
}

int currentStep = 0;

class SteperTextField extends StatelessWidget {
  const SteperTextField({
    Key? key,
    required this.controller,
    required this.svgPicture,
    required this.hintText,
    required this.padding,
    this.textInputType,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final SvgPicture svgPicture;
  final String hintText;
  final EdgeInsetsGeometry padding;
  final TextInputType? textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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






/* 
 Stepper(
                  onStepTapped: (value) {
                    setState(() {});
                    value = currentStep;
                  },
                  currentStep: currentStep,
                  physics: NeverScrollableScrollPhysics(),
                  onStepContinue: (() {
                    setState(() {
                      if (currentStep < 2) {
                        currentStep++;
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      }
                    });
                  }),
                  onStepCancel: () => setState(() {
                        if (currentStep > 0) {
                          currentStep--;
                        }
                      }),
                  steps: [
                    Step(

                        // isActive: currentStep >= 0,
                        // state: currentStep >= 0
                        //     ? StepState.editing
                        //     : StepState.disabled,

                        // state: StepState.editing,
                        state: currentStep == 0
                            ? StepState.editing
                            : StepState.complete,
                        isActive: currentStep > 0 ? true : false,
                        title: TextFieldText('NAME'),
                        content: SteperTextField(
                          textInputType: TextInputType.emailAddress,
                          controller: emaliController,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/profile.svg',
                          ),
                          hintText: 'Enter your full name',
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                        )),
                    Step(
                        state: currentStep == 1
                            ? StepState.editing
                            : StepState.complete,
                        isActive: currentStep > 1 ? true : false,
                        // isActive: currentStep >= 0,
                        // state: currentStep >= 0
                        //     ? StepState.editing
                        //     : StepState.disabled,

                        // state: StepState.editing,

                        title: TextFieldText('EMAIL'),
                        content: SteperTextField(
                          textInputType: TextInputType.emailAddress,
                          controller: emaliController,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/mail.svg',
                          ),
                          hintText: 'Enter your full name',
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                        )),
                    Step(
                        state: currentStep == 2
                            ? StepState.editing
                            : StepState.complete,
                        isActive: currentStep > 2 ? true : false,
                        // isActive: currentStep >= 0,
                        // state: currentStep >= 0
                        //     ? StepState.editing
                        //     : StepState.disabled,

                        // state: StepState.editing,

                        title: TextFieldText('PASSWORD'),
                        content: SteperTextField(
                          obscureText: true,
                          textInputType: TextInputType.datetime,
                          controller: emaliController,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/pass.svg',
                          ),
                          hintText: 'Enter your full name',
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                        )),
                  ]), */
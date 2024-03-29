// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/Data/mytask_data.dart';

import 'Auth/Login/login_page.dart';
import '../Widgets/custom_button.dart';
import 'package:task_management/utls/colors.dart';
import '../utls/textstyle.dart';

final TextEditingController selectTeamMemberController =
    TextEditingController();

final projectTaskList = TaskManager.projectTastGenarate();
final myTaskList = TaskManager.myTaskGenarate();

class InviteMemberPage extends StatefulWidget {
  const InviteMemberPage({super.key});

  @override
  State<InviteMemberPage> createState() => _InviteMemberPageState();
}

class _InviteMemberPageState extends State<InviteMemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const HeadingText(
                      '',
                      fs: 16,
                      color: Color(0xffF8F8F8),
                    ),
                    SvgPicture.asset(
                      'assets/icons/cross.svg',
                      // ignore: deprecated_member_use
                      color: kLogodeactive,
                    )
                  ],
                ),
              ),
              Container(
                height: 229,
                decoration: BoxDecoration(
                    color: kRotedBox,
                    borderRadius: BorderRadius.circular(
                      8,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: HeadingText(
                  'Add New Member',
                  fs: 16,
                ),
              ),
              const TextFieldText(
                'Make your team good with us. invite your team members. to get going',
                color: kLabelTextColor,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 16),
                child: CustomTextField(
                    titleTextFiedl: 'Team Members',
                    controller: selectTeamMemberController,
                    svgPicture: SvgPicture.asset('assets/icons/Add Person.svg'),
                    hintText: 'Select Your Team',
                    padding: const EdgeInsets.symmetric(horizontal: 16)),
              ),
              Row(
                children: [
                  Transform.rotate(
                    angle: pi / 4,
                    child: SvgPicture.asset(
                      'assets/icons/cross.svg',
                      color: kLogodeactive,
                      height: 12,
                      width: 12,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 17.64),
                    child: HeadingText(
                      'Attched Files',
                      fs: 16,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27),
                child: CustomButton(
                  text: 'Invite',
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

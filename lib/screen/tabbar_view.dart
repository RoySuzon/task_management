import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/Data/mytask_data.dart';
import 'package:task_management/screen/project_page.dart';
import '../utls/colors.dart';
import '../utls/textstyle.dart';

class TabrBarVie extends StatefulWidget {
  const TabrBarVie({super.key, this.taskManager});
  final TaskManager? taskManager;

  @override
  State<TabrBarVie> createState() => _TabrBarVieState();
}

class _TabrBarVieState extends State<TabrBarVie> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // bottomNavigationBar: ,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 16,
            color: kLabelTextColor,
          ),
          bottom: const TabBar(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 5.0, color: kButtonBackground),
                insets: EdgeInsets.only(left: 16)),
            tabs: [
              Tab(
                child: ProjectTabBarButton(count: 18, title: 'All'),
              ),
              Tab(
                child: ProjectTabBarButton(count: 18, title: 'All'),
              ),
            ],
          ),
          centerTitle: true,
          title: const HeadingText(
            'Project',
            fs: 16,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset('assets/icons/More Vertical.svg'),
            )
          ],
        ),
        body: const TabBarView(
          children: [ProjectPage(), ProjectPage()],
        ),
      ),
    );
  }
}

class ProjectTabBarButton extends StatelessWidget {
  const ProjectTabBarButton({
    Key? key,
    this.count,
    this.title,
  }) : super(key: key);
  final int? count;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, bottom: 8, top: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kButtonBackground),
            padding: const EdgeInsets.symmetric(vertical: 5.5, horizontal: 12),
            alignment: Alignment.center,
            child: HeadingText(
              count.toString(),
              fs: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        HeadingText(
          title.toString(),
          fs: 16,
        )
      ],
    );
  }
}

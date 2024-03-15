import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/screen/Auth/Login/login_page.dart';
import 'package:task_management/screen/HOME/home_page.dart';
import 'package:task_management/screen/Project/add_project_page.dart';
import 'package:task_management/screen/tabbar_view.dart';
import 'package:task_management/screen/teammember_page.dart';
import 'package:task_management/utls/colors.dart';
class PageList {
  PageList(this.page, this.icon, this.title);
  final Widget page;
  final String? icon;
  final String? title;
  static List<PageList> genaratePageList() {
    return [
      PageList(const HomePage(), 'assets/icons/roy.svg', 'My Task'),
      PageList(const LoginPage(), 'assets/icons/calendar.svg', 'Calendar'),
      PageList(const TabrBarVie(), 'assets/icons/document.svg', 'Project'),
      PageList(const TeamMemberPage(), 'assets/icons/profile.svg', 'Profile'),
    ];
  }
}

var pageList = [const HomePage(), const TabrBarVie(), const TeamMemberPage(), const LoginPage()];

final itemOfPage = PageList.genaratePageList();
class NavigaTionPageButtion extends StatefulWidget {
  const NavigaTionPageButtion({super.key});

  @override
  State<NavigaTionPageButtion> createState() => _NavigaTionPageButtionState();
}
class _NavigaTionPageButtionState extends State<NavigaTionPageButtion> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: itemOfPage.length,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: SizedBox(
            height: 64,
            width: 64,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {});
                showModalBottomSheet(
                    backgroundColor: kBackground,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                    // shape: Border.all(width: 1, color: Colors.red),
                    context: context,
                    builder: (
                      context,
                    ) =>
                        const AddProject());
              },
              child: const Icon(Icons.add),
            ),
          ),
          bottomNavigationBar: Container(
            height: 96,
            color: kLogoBacground,
            child: TabBar(
                indicatorWeight: 0.5,
                // isScrollable: true,
                tabs: List.generate(
                  itemOfPage.length,
                  (index) => Tab(
                    icon: SvgPicture.asset(
                      itemOfPage[index].icon.toString(),
                    ),
                    text: itemOfPage[index].title,
                  ),
                )),
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  itemOfPage.length, (index) => itemOfPage[index].page)),
        ));
  }
}

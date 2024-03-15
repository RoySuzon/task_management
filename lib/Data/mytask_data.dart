import 'package:flutter/material.dart';

class TaskManager {
  TaskManager({
    // this.onTap,
    this.rong,
    this.rank,
    this.color,
    this.title,
    this.subTitle,
    this.progress,
    this.day,
    this.mark,
    this.height,
  });
  final Color? color;
  final String? title;
  final String? subTitle;
  final String? progress;
  final String? day;
  final int? mark;
  final double? height;
  final double? rank;
  final Mycolor? rong;
  // final Widget? onTap;

  static List<TaskManager> projectTastGenarate() {
    return [
      TaskManager(
        rong: Mycolor.genarateColorlist()[0],
        color: const Color(0xff9C67F9),
        progress: '5',
        subTitle: 'Ongoing',
      ),
      TaskManager(
        color: const Color(0xffF79293),
        progress: '7',
        subTitle: 'Under\nReview',
        rong: Mycolor.genarateColorlist()[3],
      ),
      TaskManager(
        color: const Color(0xff76BBAA),
        progress: '4',
        subTitle: 'Uncoming',
        rong: Mycolor.genarateColorlist()[2],
      ),
      TaskManager(
        color: const Color(0xff9C67F9),
        progress: '6',
        subTitle: 'Top Rate',
        rong: Mycolor.genarateColorlist()[1],
      ),
    ];
  }

  static List<TaskManager> myTaskGenarate() {
    return [
      TaskManager(
        color: const Color(0xff9C67F9),
        title: 'Research Analysis',
        progress: 'Urgent',
        day: '2 Days Left',
        mark: 6,
        rank: 255,
      ),
      TaskManager(
        color: const Color(0xff76BBAA),
        title: 'Research Analysis',
        progress: 'In Review',
        day: '2 Days Left',
        mark: 20,
        rank: 200,
        // onTap: HomePage(),
      ),
      TaskManager(
        color: const Color(0xff76BBAA),
        title: 'Research Analysis',
        progress: 'In Review',
        day: '2 Days Left',
        mark: 20,
        rank: 200,
        // onTap: HomePage(),
      ),
      TaskManager(
          color: const Color(0xff9C67F9),
          title: 'Research Analysis',
          progress: 'In Progress',
          day: '2 Days Left',
          mark: 5,
          rank: 190),
      TaskManager(
          color: const Color(0xff9c67f9),
          title: 'Research Analysis',
          progress: 'Approve',
          day: '2 Days Left',
          mark: 8,
          rank: 170),
      TaskManager(
          color: const Color(0xffF79293),
          title: 'Research Analysis',
          progress: 'Urgent',
          day: '2 Days Left',
          mark: 8,
          rank: 150),
      TaskManager(
          color: const Color(0xffF79293),
          title: 'Research Analysis',
          progress: 'Urgent',
          day: '2 Days Left',
          mark: 8,
          rank: 150),
      TaskManager(
          color: const Color(0xff9c67f9),
          title: null,
          progress: 'Approve',
          day: '2 Days Left',
          mark: 8,
          rank: 170),
    ];
  }
}

List<Color> colorsData = [
  const Color(0xff246BFD),
  const Color(0xffF79293),
  const Color(0xffFFBE3C),
  const Color(0xff9C67F9),
  const Color(0xff76BBAA),
  const Color(0xffE6EBF8),
  const Color(0xffFEEBF5),
  const Color(0xffFFF6E4),
  const Color(0xffF8F0FF),
  const Color(0xffF8F0FF),
  const Color(0xffDDEEEA),
  const Color(0xffE4E4E6),
  const Color(0xff8E8E93),
  const Color(0xffAEAEB2),
  const Color(0xffC7C7CC),
];

class Mycolor {
  Mycolor(this.color);
  final Color? color;
  static List<Mycolor> genarateColorlist() {
    return [
      Mycolor(
        const Color(
          0xff246BFD,
        ),
      ),
      Mycolor(
        const Color(0xffF79293),
      ),
      Mycolor(
        const Color(0xffFFBE3C),
      ),
      Mycolor(
        const Color(0xff246BFD),
      ),
      Mycolor(
        const Color(0xff246BFD),
      ),
    ];
  }
}

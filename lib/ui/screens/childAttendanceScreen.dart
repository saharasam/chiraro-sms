import 'package:eschool/cubits/attendanceCubit.dart';
import 'package:eschool/data/repositories/studentRepository.dart';
import 'package:eschool/ui/widgets/attendanceContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ChildAttendanceScreen extends StatelessWidget {
  final int childId;
  const ChildAttendanceScreen({Key? key, required this.childId})
      : super(key: key);

  static Widget routeInstance() {
    return BlocProvider<AttendanceCubit>(
      create: (context) => AttendanceCubit(StudentRepository()),
      child: ChildAttendanceScreen(
        childId: Get.arguments as int,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AttendanceContainer(
        childId: childId,
      ),
    );
  }
}

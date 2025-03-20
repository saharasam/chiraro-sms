import 'package:eschool/cubits/schoolGalleryCubit.dart';
import 'package:eschool/cubits/schoolSessionYearsCubit.dart';

import 'package:eschool/data/models/student.dart';
import 'package:eschool/data/repositories/schoolRepository.dart';

import 'package:eschool/ui/widgets/schoolGalleryWithSessionYearFilterContainer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SchoolGalleryScreen extends StatelessWidget {
  final Student student;
  SchoolGalleryScreen({Key? key, required this.student}) : super(key: key);

  static Widget routeInstance() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SchoolGalleryCubit(SchoolRepository()),
        ),
        BlocProvider(
          create: (context) => SchoolSessionYearsCubit(SchoolRepository()),
        ),
      ],
      child: SchoolGalleryScreen(
        student: Get.arguments as Student,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SchoolGalleryWithSessionYearFilterContainer(
          showBackButton: true, student: student),
    );
  }
}

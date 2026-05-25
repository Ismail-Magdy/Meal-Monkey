import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/logic/cubit/image_storage_cubit.dart';
import 'package:meal_monkey/features/splashs/screens/logo_screen.dart';

class MealMonkey extends StatelessWidget {
  const MealMonkey({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => ImageStorageCubit(),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: MaterialApp(
              theme: ThemeData(scaffoldBackgroundColor: Colors.white),
              debugShowCheckedModeBanner: false,
              home: const LogoScreen(),
            ),
          ),
        );
      },
    );
  }
}

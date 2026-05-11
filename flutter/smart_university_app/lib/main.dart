import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/splash/presentation/splach_screen.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  DioHelper.init();
  await ScreenUtil.ensureScreenSize();
  runApp(const ProviderScope(child: SmartUniversityApp()));
}

class SmartUniversityApp extends StatelessWidget {
  const SmartUniversityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
            textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        );
      },
    );
  }
}



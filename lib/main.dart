import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/presentation/pages/home_view.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1080, 1920),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return
        MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: FlexThemeData.light(
                scaffoldBackground: Theme.of(context).scaffoldBackgroundColor,
                scheme: FlexScheme.jungle,
                surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
                blendLevel: 20,
                appBarOpacity: 0.95,
                subThemesData: const FlexSubThemesData(
                  blendOnLevel: 20,
                  blendOnColors: false,
                  navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
                  navigationRailMutedUnselectedLabel: false,
                  navigationRailSelectedIconSchemeColor: SchemeColor.primary,
                  navigationRailMutedUnselectedIcon: false,
                ),
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                useMaterial3: true,
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 42.sp, color: const Color(0xFF004E15)),
                  bodyText2: TextStyle(
                      fontSize: 42.sp, color: const Color(0xFF004E15)),
                  caption: TextStyle(fontSize: 33.sp),
                )),
            darkTheme: FlexThemeData.dark(
              scheme: FlexScheme.jungle,
              surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
              blendLevel: 15,
              appBarStyle: FlexAppBarStyle.background,
              appBarOpacity: 0.90,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 30,
                navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
                navigationRailMutedUnselectedLabel: false,
                navigationRailSelectedIconSchemeColor: SchemeColor.primary,
                navigationRailMutedUnselectedIcon: false,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              useMaterial3: true,
              // To use the playground font, add GoogleFonts package and uncomment
              // fontFamily: GoogleFonts.notoSans().fontFamily,
            ),
        home: HomeView(),
      );
      })
    );
    
  }
}

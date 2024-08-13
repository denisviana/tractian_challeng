import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:my_app/app/pages/home_page.dart';
import '../generated/l10n.dart';
import 'app_binding.dart';
import 'styles/app_color_scheme.dart';
import 'styles/app_theme_data.dart';
import 'utils/widget_utils.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        navigatorKey: Get.key,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        builder: (context, child) => Scaffold(
            backgroundColor: AppColorScheme.background,
            body: GestureDetector(
              onTap: () => WidgetUtils.hideKeyboard(context),
              child: child,
            ),
          ),
        debugShowCheckedModeBanner: false,
        title: 'Tractian',
        home: HomePage(),
        initialBinding: AppBinding(),
        theme: ThemeDataMyApp.lightTheme,
        themeMode: ThemeMode.light,
      );
}

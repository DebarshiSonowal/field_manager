import 'package:field_manager/Repository/Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Navigation/navigation.dart';
import 'Router/router.dart';
import 'Storage/storage.dart';
import 'Theme/app_theme.dart';

const settingsiOS = OpenSettingsPlusIOS();
const settingsAndroid = OpenSettingsPlusAndroid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.instance.initializeStorage();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Field Manager',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Repository(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return Consumer<Repository>(builder: (context, Repository data, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Guwahati Plus',
            // darkTheme: AppTheme.getDarkTheme(),
            theme: data.isDark
                ? AppTheme.getLightTheme()
                : AppTheme.getDarkTheme(),
            themeMode: ThemeMode.system,
            navigatorKey: Navigation.instance.navigatorKey,
            onGenerateRoute: generateRoute,
            builder: EasyLoading.init(),
          );
        });
      }),
    );
  }
}

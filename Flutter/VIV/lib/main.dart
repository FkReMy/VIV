import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/scaffolds/desktop_scaffold/desktop_scaffold.dart';
import 'package:viv/components/scaffolds/mobile_scaffold/mobile_scaffold.dart';
import 'package:viv/components/scaffolds/tablet_scaffold/tablet_scaffold.dart';
import 'package:viv/helpers/responsive/responsive_layout.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'VIV',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const SafeArea(
            top: true,
            child: ResponsiveLayout(
              mobileScaffold: MobileScaffold(),
              tabletScaffold: TabletScaffold(),
              desktopScaffold: DesktopScaffold(),
            )));
  }
}

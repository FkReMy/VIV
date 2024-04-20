import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/common/colors/colors.dart';
import 'package:viv/components/common/widgets/all/signed/c_drawer/c_drawer.dart';
import 'package:viv/components/common/widgets/mobile_x_tablet/mxt_default/app_bar/mxt_appbar.dart';
import 'package:viv/firebase_options.dart';

void main() async {
  // Ensure that Flutter binding is initialized before runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const TabletScaffold());
}

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // Listen for changes in user authentication state
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is Logged in
            return Scaffold(
              backgroundColor: lightgray,
              appBar: MxTAppbar(
                bColor: black,
                tcolor: white,
                icolor: white,
                appBar: AppBar(),
              ),
              endDrawer: const CDrawer(
                icolor: black,
                text: "Menu",
                bColor: white,
              ),
              body: ListView(
                children: const [
                  Column(children: []),
                ],
              ),
            );
          } else {
            // User is not Logged in
            return const Scaffold();
          }
        },
      ),
    );
  }
}

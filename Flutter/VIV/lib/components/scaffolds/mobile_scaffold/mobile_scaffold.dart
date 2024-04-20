import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/common/colors/colors.dart';
import 'package:viv/components/common/widgets/all/signed/c_drawer/c_drawer.dart';
import 'package:viv/components/common/widgets/mobile_x_tablet/mxt_default/app_bar/mxt_appbar.dart';
import 'package:viv/components/scaffolds/mobile_scaffold/m_layout/m_home_screen/m_home_screen.dart';
import 'package:viv/components/scaffolds/mobile_scaffold/m_login_or_register/m_login_or_register.dart';
import 'package:viv/firebase_options.dart';

void main() async {
  // Ensure that Flutter binding is initialized before runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const MobileScaffold());
}

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // Listen for changes in user authentication state
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is Logged in
          if (snapshot.hasData) {
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
              body: const MHomeScreen(),
            );
          }

          // User is not Logged in
          else {
            return const MLoginOrRegister();
          }
        },
      ),
    );
  }
}

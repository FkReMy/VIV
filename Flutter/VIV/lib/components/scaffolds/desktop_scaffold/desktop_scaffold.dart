import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viv/components/Common/Colors/Colors.dart';
import 'package:viv/components/common/widgets/all/signed/c_drawer/c_drawer.dart';
import 'package:viv/components/scaffolds/desktop_scaffold/d_layout/d_unsigned/d_login_screen/d_login_screen.dart';
import 'package:viv/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DesktopScaffold());
}

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            // If the user is authenticated, show the main content
            return Scaffold(
              backgroundColor: lightgray,
              body: Row(
                children: [
                  const CDrawer(
                    icolor: black,
                    text: "V I V",
                    bColor: white,
                  ),
                  // Add your main content here based on the authenticated user
                  // For now, an empty column is shown
                  ListView(
                    children: const [
                      Column(children: []),
                    ],
                  )
                ],
              ),
            );
          } else {
            // If the user is not authenticated, show the login screen
            return Scaffold(
              backgroundColor: white,
              body: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 12.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 1.0, color: black),
                        ),
                      ),
                      child: Image.asset("assets/images/vivb.png"),
                    ),
                  ),
                  const Expanded(child: DLoginScreen()),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

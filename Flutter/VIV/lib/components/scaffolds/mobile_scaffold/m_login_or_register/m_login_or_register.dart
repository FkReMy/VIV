import 'package:flutter/material.dart';
import 'package:viv/components/common/widgets/mobile_x_tablet/mxt_unsigned/mxt_login_screen/mxt_login_screen.dart';
import 'package:viv/components/common/widgets/mobile_x_tablet/mxt_unsigned/mxt_register_screen/mxt_register_screen.dart';

class MLoginOrRegister extends StatefulWidget {
  const MLoginOrRegister({super.key});

  @override
  State<MLoginOrRegister> createState() => _MLoginOrRegisterState();
}

class _MLoginOrRegisterState extends State<MLoginOrRegister> {
  //initially show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return MxTLoginScreen(
        onTap: togglePages,
      );
    }
    else {
      return MxTRegisterScreen(
        onTap: togglePages,
      );
    }
  }
}

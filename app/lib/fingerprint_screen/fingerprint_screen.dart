import 'package:bank_for_all/landing_screen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_auth_invisible/flutter_local_auth_invisible.dart';

class FingerPrintScreen extends StatefulWidget {
  const FingerPrintScreen({Key key}) : super(key: key);

  @override
  _FingerPrintScreenState createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState extends State<FingerPrintScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<void> _authenticateMe() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Authenticate for Testing", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    if (!mounted) return;

    if (authenticated) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LandingScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _authenticateMe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Authenticate with fingerprint to continue",
            style: TextStyle(color: Colors.white, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Icon(
            Icons.fingerprint,
            size: 80,
            color: Colors.white,
          ),
        ],
      )),
    );
  }
}

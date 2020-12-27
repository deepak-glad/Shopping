import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shopping_app/screen/ordered_screen.dart';

class FingerPrint extends StatefulWidget {
  @override
  _FingerPrintState createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  Future<bool> _isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return isAvailable;

    isAvailable
        ? print('Biometric is available')
        : print('Biometric is not available');
    return isAvailable;
  }

  Future<void> _getBiometricTypes() async {
    List<BiometricType> listofBiometric;
    try {
      listofBiometric = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    print(listofBiometric);
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason:
            "Please authenticate to view your transaction overview",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    isAuthenticated
        ? print('User is authenticated!')
        : print('User is not authenticated.');

    if (isAuthenticated) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OrderScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(onPressed: () async {
        if (await _isBiometricAvailable()) {
          await _getBiometricTypes();
          await _authenticateUser();
        }
        //...
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habitson/view/widgets/appbar_onlyback_widget.dart';
import 'package:habitson/view/widgets/privacy_policy_widget.dart';

class ScreenPrivacyPolicy extends StatelessWidget {
  const ScreenPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOnlyBack(),
            Expanded(
                child:
                    SizedBox(height: size.height, child: const PrivacyPolicyWidget())),
          ],
        ),
      ),
    );
  }
}

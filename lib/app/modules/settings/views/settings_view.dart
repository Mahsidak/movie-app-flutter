import 'package:flutter/material.dart';
import '../../../core/widget/custom_app_bar.dart';

class SettingsView extends StatelessWidget {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Settings',
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          _getHorizontalDivider(),
        ],
      ),
    );
  }

  Widget _getHorizontalDivider() {
    return const Divider(height: 1);
  }

  }
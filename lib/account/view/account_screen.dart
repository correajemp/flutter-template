import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:template/utils/commons/colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AccountContent());
  }
}

class AccountContent extends StatefulWidget {
  const AccountContent({super.key});

  @override
  State<AccountContent> createState() {
    return AccountContentState();
  }
}

class AccountContentState extends State<AccountContent> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration()).then((_) {
      _refreshIndicatorKey.currentState?.show();
      _refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    RefreshIndicator refreshIndicator = RefreshIndicator(
      key: _refreshIndicatorKey,
      color: primaryColor,
      onRefresh: _refresh,
      child: _accountContentWidget(),
    );

    if (Platform.isIOS) {
      refreshIndicator = RefreshIndicator.adaptive(
        key: _refreshIndicatorKey,
        color: whiteColor,
        onRefresh: _refresh,
        child: _accountContentWidget(),
      );
    }

    return refreshIndicator;
  }

  Widget _accountContentWidget() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(),
    );
  }

  Future<void> _refresh() async {
    final Completer<void> completer = Completer<void>();

    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });

    setState(() {});

    return completer.future.then<void>((_) {});
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:template/utils/commons/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeContent());
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() {
    return HomeContentState();
  }
}

class HomeContentState extends State<HomeContent> {
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
      child: _homeContentWidget(),
    );

    if (Platform.isIOS) {
      refreshIndicator = RefreshIndicator.adaptive(
        key: _refreshIndicatorKey,
        color: whiteColor,
        onRefresh: _refresh,
        child: _homeContentWidget(),
      );
    }

    return refreshIndicator;
  }

  Widget _homeContentWidget() {
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

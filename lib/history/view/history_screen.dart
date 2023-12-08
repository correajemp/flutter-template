import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:template/utils/commons/colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HistoryContent());
  }
}

class HistoryContent extends StatefulWidget {
  const HistoryContent({super.key});

  @override
  State<HistoryContent> createState() {
    return HistoryContentState();
  }
}

class HistoryContentState extends State<HistoryContent> {
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
      child: _historyContentWidget(),
    );

    if (Platform.isIOS) {
      refreshIndicator = RefreshIndicator.adaptive(
        key: _refreshIndicatorKey,
        color: whiteColor,
        onRefresh: _refresh,
        child: _historyContentWidget(),
      );
    }

    return refreshIndicator;
  }

  Widget _historyContentWidget() {
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

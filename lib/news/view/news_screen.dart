import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:template/utils/commons/colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NewsContent());
  }
}

class NewsContent extends StatefulWidget {
  const NewsContent({super.key});

  @override
  State<NewsContent> createState() {
    return NewsContentState();
  }
}

class NewsContentState extends State<NewsContent> {
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
      child: _newsContentWidget(),
    );

    if (Platform.isIOS) {
      refreshIndicator = RefreshIndicator.adaptive(
        key: _refreshIndicatorKey,
        color: whiteColor,
        onRefresh: _refresh,
        child: _newsContentWidget(),
      );
    }

    return refreshIndicator;
  }

  Widget _newsContentWidget() {
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

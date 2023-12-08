import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/utils/commons/colors.dart';

class LoadingIndicatorDialog {
  static Future<void> show(
    BuildContext context,
    GlobalKey key,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            backgroundColor: whiteColor,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Platform.isAndroid
                          ? const CircularProgressIndicator()
                          : const CupertinoActivityIndicator(),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static dismiss(GlobalKey key) async {
    Navigator.of(
      key.currentContext!,
      rootNavigator: true,
    ).pop();
  }
}

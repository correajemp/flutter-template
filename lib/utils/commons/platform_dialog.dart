import 'dart:io';

import 'package:common_repository/common_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:template/utils/commons/colors.dart';
import 'package:template/utils/commons/styles.dart';

void showPlatformDialog({
  required BuildContext context,
  String? title,
  required String content,
  required String positiveText,
  required String negativeText,
  required VoidCallback? positiveCallback,
  required VoidCallback? negativeCallback,
  bool isShowPositiveButton = true,
}) {
  Future.delayed(
    Duration.zero,
    () {
      final appName = dotenv.env['APP_NAME'] ?? 'Template App';

      if (errorMessageResponse?.error == 'unauthorized' ||
          errorMessageResponse?.error == 'token_expired') {
        if (context.mounted) {
          context.goNamed('login');
          return;
        }
      }

      String newContent = content;
      if (newContent.toLowerCase().contains('function')) {
        newContent = genericErrorMessage.toString();
      }
      if (newContent.toLowerCase().contains('nosuchmethoderror')) {
        newContent = genericErrorMessage.toString();
      }

      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (Platform.isIOS || Platform.isMacOS) {
            return CupertinoAlertDialog(
              title: Text(
                title ?? appName,
                style: const TextStyle(
                  color: slate900,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: letterSpacing,
                ),
                textAlign: TextAlign.center,
              ),
              content: Text(
                newContent,
                style: const TextStyle(
                  color: slate900,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: letterSpacing,
                ),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    ExceptionHandlers().clearError();
                    Navigator.of(context).pop();
                    negativeCallback?.call();
                  },
                  child: Text(
                    negativeText,
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: letterSpacing,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (isShowPositiveButton)
                  TextButton(
                    onPressed: () {
                      ExceptionHandlers().clearError();
                      Navigator.of(context).pop();
                      positiveCallback?.call();
                    },
                    child: Text(
                      positiveText,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: letterSpacing,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ],
            );
          }
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            title: Text(
              title ?? appName,
              style: const TextStyle(
                color: slate900,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                letterSpacing: letterSpacing,
              ),
              textAlign: TextAlign.center,
            ),
            content: Text(
              newContent,
              style: const TextStyle(
                color: slate900,
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                letterSpacing: letterSpacing,
              ),
              textAlign: TextAlign.center,
            ),
            actionsAlignment: isShowPositiveButton
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            actions: [
              TextButton(
                onPressed: () {
                  ExceptionHandlers().clearError();
                  Navigator.of(context).pop();
                  negativeCallback?.call();
                },
                child: Text(
                  negativeText,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: letterSpacing,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (isShowPositiveButton)
                TextButton(
                  onPressed: () {
                    ExceptionHandlers().clearError();
                    Navigator.of(context).pop();
                    positiveCallback?.call();
                  },
                  child: Text(
                    positiveText,
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: letterSpacing,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
            ],
          );
        },
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/utils/commons/colors.dart';
import 'package:template/utils/commons/styles.dart';
import 'package:template/utils/extensions/double.dart';

class AppHeaderContent extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onHome;
  final bool hasBackButton;
  final bool hasHomeButton;
  final bool hasBackButtonTitle;

  const AppHeaderContent({
    Key? key,
    required this.title,
    this.onBack,
    this.onHome,
    this.hasBackButton = true,
    this.hasHomeButton = false,
    this.hasBackButtonTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20.0),
          InkWell(
            onTap: () {
              onBack?.call();
            },
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/vectors/ic_back.svg'),
                if (hasBackButtonTitle) const SizedBox(width: 8.0),
                if (hasBackButtonTitle)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: primitiveBlackColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: letterSpacing,
                        height: 20.0.toLineHeight(fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                title,
                style: TextStyle(
                  color: primitiveBlackColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: letterSpacing,
                  height: 20.0.toLineHeight(fontSize: 16.0),
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (hasHomeButton)
            InkWell(
              onTap: () {
                onHome?.call();
              },
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: SvgPicture.asset('assets/vectors/ic_home.svg'),
            ),
          const SizedBox(width: 20.0),
        ],
      ),
    );
  }
}

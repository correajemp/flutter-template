import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/dashboard/dashboard.dart';
import 'package:template/utils/commons/colors.dart';
import 'package:template/utils/commons/platform_dialog.dart';
import 'package:template/utils/commons/styles.dart';
import 'package:template/utils/extensions/double.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiRepositoryProvider(
        providers: const [],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) {
              return BottomNavigationBloc();
            }),
          ],
          child: const DashboardContent(),
        ),
      ),
    );
  }
}

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() {
    return DashboardContentState();
  }
}

class DashboardContentState extends State<DashboardContent> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    context
        .read<BottomNavigationBloc>()
        .add(BottomNavigationChange(index: _selectedIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final currentBottomNavigationItem =
              context.read<BottomNavigationBloc>().state.bottomNavigationItem;
          if (currentBottomNavigationItem != BottomNavigationItem.home) {
            context
                .read<BottomNavigationBloc>()
                .add(const BottomNavigationChange(index: 0));
            return false;
          }
          showPlatformDialog(
            context: context,
            title: 'Exit Confirmation',
            content: 'Are you sure you want to exit the app?',
            positiveText: 'Exit',
            negativeText: 'Cancel',
            positiveCallback: () async {
              SystemNavigator.pop();
            },
            negativeCallback: null,
          );
          return true;
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: whiteColor,
          child: DashboardBodyContent(selectedIndex: _selectedIndex),
        ),
      ),
      backgroundColor: slate100,
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: _mapStateToIndex(state),
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              color: primaryColor,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              letterSpacing: letterSpacing,
              height: 16.0.toLineHeight(fontSize: 12.0),
            ),
            unselectedLabelStyle: TextStyle(
              color: slate500,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              letterSpacing: letterSpacing,
              height: 16.0.toLineHeight(fontSize: 12.0),
            ),
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/vectors/ic_scan.svg',
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset('assets/vectors/ic_scan.svg'),
                label: 'Scan',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/vectors/ic_play.svg',
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset('assets/vectors/ic_play.svg'),
                label: 'Play',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/vectors/ic_transactions.svg',
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset('assets/vectors/ic_transactions.svg'),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/vectors/ic_faqs.svg',
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset('assets/vectors/ic_faqs.svg'),
                label: 'FAQs',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/vectors/ic_profile.svg',
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                icon: SvgPicture.asset('assets/vectors/ic_profile.svg'),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      context
          .read<BottomNavigationBloc>()
          .add(BottomNavigationChange(index: index));
    });
  }

  int _mapStateToIndex(BottomNavigationState state) {
    if (state.bottomNavigationItem == BottomNavigationItem.home) {
      return 0;
    }
    if (state.bottomNavigationItem == BottomNavigationItem.news) {
      return 1;
    }
    if (state.bottomNavigationItem == BottomNavigationItem.history) {
      return 2;
    }
    if (state.bottomNavigationItem == BottomNavigationItem.account) {
      return 3;
    }
    return 0;
  }
}

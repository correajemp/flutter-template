import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/account/account.dart';
import 'package:template/dashboard/dashboard.dart';
import 'package:template/history/history.dart';
import 'package:template/home/home.dart';
import 'package:template/news/news.dart';

class DashboardBodyContent extends StatefulWidget {
  final int selectedIndex;

  const DashboardBodyContent({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<DashboardBodyContent> createState() {
    return DashboardBodyContentState();
  }
}

class DashboardBodyContentState extends State<DashboardBodyContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: ((context, state) {
        if (state.bottomNavigationItem == BottomNavigationItem.home) {
          return const HomeScreen();
        }
        if (state.bottomNavigationItem == BottomNavigationItem.news) {
          return const NewsScreen();
        }
        if (state.bottomNavigationItem == BottomNavigationItem.history) {
          return const HistoryScreen();
        }
        if (state.bottomNavigationItem == BottomNavigationItem.account) {
          return const AccountScreen();
        }
        return Container();
      }),
    );
  }
}

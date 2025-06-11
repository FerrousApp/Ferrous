import 'package:ferrous/pages/invest/invest.dart';
import 'package:ferrous/pages/events/events.dart';
import 'package:ferrous/pages/home/home.dart';
import 'package:ferrous/pages/more/more.dart';
import 'package:ferrous/pages/primary/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryPage extends ConsumerStatefulWidget {
  const PrimaryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends ConsumerState<PrimaryPage> {
  PageController primaryPageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    primaryPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///
    final currentPage = ref.watch(primaryPageIndexProvider);

    return Scaffold(
      ///
      body: PageView.builder(
        controller: primaryPageController,
        itemCount: 4,
        onPageChanged: (value) async {
          ref.read(primaryPageIndexProvider.notifier).setIndex(value);
        },
        itemBuilder: ((context, index) => const [
              HomePage(),
              InvestPage(),
              EventsPage(),
              MorePage(),
            ].elementAt(index)),
      ),

      ///
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // jump to page
          ref.read(primaryPageIndexProvider.notifier).setIndex(index);
          primaryPageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Invest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

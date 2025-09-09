import 'package:ferrous/pages/home/home.dart';
import 'package:ferrous/pages/explore/explore.dart';

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
  // moved out for use in the homepage
  // PageController primaryPageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    // primaryPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///
    final currentPage = ref.watch(primaryPageIndexProvider);

    return Scaffold(
      ///
      body: PageView.builder(
        controller: currentPage,
        itemCount: 3,
        onPageChanged: (value) async {
          ref.read(primaryPageIndexProvider.notifier).setIndex(value);
        },
        itemBuilder: ((context, index) => const [
              HomePage(),
              ExplorePage(),
              MorePage(),
            ].elementAt(index)),
      ),

      ///
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage.initialPage,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // jump to page
          ref.read(primaryPageIndexProvider.notifier).setIndex(index);
          currentPage.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.precision_manufacturing),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

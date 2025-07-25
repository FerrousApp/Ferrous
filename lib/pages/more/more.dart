import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/pages/ai/ai.dart';
import 'package:ferrous/pages/more/components/more_action_tile.dart';
// import 'package:ferrous/pages/more/components/more_action_tile.dart';
import 'package:ferrous/themes/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MorePage extends ConsumerWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmallScreen = AppSizing.width(context) < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'More',
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),

      ///
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 6 : 12,
          vertical: 6,
        ),
        children: [
          ///
          const Text(
            "PERSONAL DETAILS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => MoreActionTile(
                  icon: Icons.person,
                  text: "My Profile",
                  onTap: () {},
                ),
              ),
            ),
          ),

          ///
          // const SizedBox(height: 10),

          const Text(
            "APP",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return MoreActionTile(
                      icon: Icons.bubble_chart_outlined,
                      text: "ION AI",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IONAIPage(),
                          ),
                        );
                      },
                    );
                  }

                  /// TODO: add currency converter
                  return MoreActionTile(
                    icon: Icons.color_lens_outlined,
                    text: "Change app theme",
                    onTap: () {
                      ref.read(themeModeProvider.notifier).changeTheme();
                    },
                    trailing: ref.watch(themeModeProvider) == ThemeMode.light
                        ? Icons.wb_sunny_outlined
                        : Icons.mode_night_outlined,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

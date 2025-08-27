import 'package:ferrous/pages/balance/balance.dart';
import 'package:ferrous/pages/events/events.dart';
import 'package:ferrous/pages/home/components.dart/quickaction_tile.dart';
import 'package:ferrous/pages/portfolio/portfolio.dart';
import 'package:ferrous/pages/primary/providers/provider.dart';
import 'package:ferrous/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    ///
    final currentPage = ref.watch(primaryPageIndexProvider);

    ///
    return Scaffold(
      appBar: AppBar(
        ///
        leading: IconButton(
          style: IconButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.amber,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
          icon: Icon(Icons.person_outline),
        ),

        ///
        title: ListTile(
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            "Good Morning,",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Obiajulu",
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),

        ///
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
        ],
      ),

      ///
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            title: Text(
              "Account Value",
              // "",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            // TODO: ontap, blur widget
            subtitle: Text(
              "\u20A61,000,000",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                // height: 2,
              ),
            ),

            /// profit percent
            trailing: Text(
              "\u2191 24%",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),

          /// --
          SizedBox(
            height: 30,
          ),

          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(12),
            child: GestureDetector(
              onTap: () {
                // sequence to jump to the invest page
                ref.read(primaryPageIndexProvider.notifier).setIndex(1);
                currentPage.jumpToPage(1);
              },
              child: Container(
                height: 200,
                clipBehavior: Clip.hardEdge,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.amber,
                  gradient: LinearGradient(
                    colors: [
                      Colors.amber.withValues(alpha: 0.8),
                      Colors.amber.withValues(alpha: 0.7),
                      Colors.amber.withValues(alpha: 0.6),
                    ],
                  ),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ///
                    Lottie.asset(
                      'assets/lotties/onboard.json',
                    ),

                    ///
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        Text(
                          "Enjoy up to 99% returns annually!",
                          style: TextStyle(
                            // fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),

                        Spacer(),

                        ///
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                foregroundColor: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black87
                                    : Colors.white70,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Color(0xFF121212),
                              ),
                              onPressed: () {
                                // sequence to jump to the invest page
                                ref
                                    .read(primaryPageIndexProvider.notifier)
                                    .setIndex(1);
                                currentPage.jumpToPage(1);
                              },
                              label: Icon(Icons.arrow_forward),
                              icon: Text(
                                "Start Investing",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          ///
          SizedBox(
            height: 30,
          ),

          ///
          Text(
            "Actions",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),

          ///
          GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              ///
              if (index == 0) {
                return QuickActionTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PortfolioPage(),
                      ),
                    );
                  },
                  color: Colors.blue,
                  title: "Portfolio",
                  icon: Icon(
                    Icons.donut_large_outlined,
                  ),
                  subtitle: "",
                  // subtitle: "\u20A6200,000",
                );
              }

              ///
              if (index == 1) {
                return QuickActionTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AccountBalancePage(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.wallet,
                  ),
                  color: Colors.teal,
                  title: "Wallet",
                  subtitle: "",
                );
              }

              ///
              if (index == 2) {
                return QuickActionTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventsPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.hourglass_empty_outlined),
                  color: Colors.deepPurpleAccent,
                  title: "History",
                  subtitle: "",
                );
              }

              ///
              if (index == 3) {
                return QuickActionTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventsPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.verified_outlined),
                  color: Colors.red,
                  title: "Verify My Identity",
                  subtitle: "",
                );
              }

              ///
              if (index == 4) {
                return QuickActionTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventsPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.group_outlined),
                  color: Colors.pinkAccent,
                  title: "Invite a Friend",
                  subtitle: "",
                );
              }

              ///
              return QuickActionTile(
                onTap: () {},
                color: Colors.brown,
                icon: Icon(Icons.public),
                title: "Stay Updated",
                subtitle: "",
              );
            },
          ),
        ],
      ),
    );
  }
}

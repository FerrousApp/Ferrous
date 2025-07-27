import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class PortfolioPage extends ConsumerStatefulWidget {
  const PortfolioPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends ConsumerState<PortfolioPage> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Portfolio",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),

        ///
        actions: [
          SearchAnchor(
            builder: (context, controller) {
              return Icon(
                Icons.search,
                color: Colors.amber,
              );
            },
            suggestionsBuilder: (context, controller) {
              // Return an empty list for now, or provide your own suggestions
              return const Iterable<Widget>.empty();
            },
          ),
        ],
      ),

      ///
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Expanded(
          //             child: IconButton(
          //               style: IconButton.styleFrom(
          //                 backgroundColor: Colors.red,
          //                 foregroundColor: Colors.white,
          //                 shape: CircleBorder(),
          //               ),
          //               icon: Icon(Icons.arrow_upward_outlined),
          //               onPressed: () {},
          //             ),
          //           ),

          //           ///
          //           Expanded(
          //             child: IconButton(
          //               style: IconButton.styleFrom(
          //                 foregroundColor: Colors.white,
          //                 backgroundColor: Colors.blue,
          //                 shape: CircleBorder(),
          //               ),
          //               icon: Icon(Icons.swap_horiz_outlined),
          //               onPressed: () {},
          //             ),
          //           ),

          //           ///
          //           Expanded(
          //             child: IconButton(
          //               style: IconButton.styleFrom(
          //                 backgroundColor: Colors.green,
          //                 foregroundColor: Colors.white,
          //                 shape: CircleBorder(),
          //               ),
          //               icon: Icon(Icons.arrow_downward_outlined),
          //               onPressed: () {},
          //             ),
          //           ),
          //         ],
          //       ),
          ///
          ///

          /// TODO: add tabbar to filter the types of investments, color code the investments

          ///
          for (int i = 0; i < 10; i++)
            Container(
              padding: const EdgeInsets.all(18),
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo.withValues(alpha: 0.5),
                    Colors.indigo.withValues(alpha: 0.4),
                    Colors.indigo.withValues(alpha: 0.3),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Lottie.asset("assets/lotties/0.json"),
                        backgroundColor:
                            Colors.grey.shade200, // Fallback background
                      ),

                      ///
                      const SizedBox(width: 12),

                      ///
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "XRP / USDT",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Shares on the XRPL blockchain",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "24%",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'APY', // This text is fixed in the image
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  ///
                  const Divider(
                    height: 24,
                    thickness: 1,
                    color: Colors.black12,
                  ),

                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Portfolio value',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "\$400",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Profits',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "\$300",
                            style: TextStyle(
                              color: Colors.green.shade600,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/pages/home/newhome.dart';
import 'package:ferrous/pages/portfolio/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lottie/lottie.dart';

class InvestPage extends ConsumerStatefulWidget {
  const InvestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InvestPageState();
}

class _InvestPageState extends ConsumerState<InvestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Invest",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      ///
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PortfolioPage(),
                ),
              );
            },
            child: FrostedGlassContainer(
              height: 150,
              margin: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 0,
              ),
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  ///
                  Expanded(
                    flex: 4,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 0,
                      ),
                      title: Text(
                        "My portfolio",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        "See all your holdings here",
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

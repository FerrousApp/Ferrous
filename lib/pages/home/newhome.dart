import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///
        leading: IconButton(
          style: IconButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.amberAccent,
              ),
            ),
          ),
          onPressed: () {},
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
            icon: Icon(Icons.notifications),
          ),
        ],
      ),

      ///
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 0,
            ),
            minVerticalPadding: 0,
            title: Text(
              "My portfolio value",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              "\$1,000,000",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                // height: 2,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.visibility_outlined),
            ),
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(36),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 0,
                ),
                child: Text(
                  "24hr profit is \$500,000",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),

              /// profit percent
              Text("\u219124%"),
            ],
          ),

          ///
          SizedBox(
            height: 30,
          ),

          ///
          Text(
            "My Portfolio",
            style: TextStyle(
              fontSize: 18,
            ),
          ),

          //
          SizedBox(
            height: 10,
          ),

          //TODO: animate me, then on tap open the page of all my investments
          SizedBox(
            height: 150,
            child: PageView.builder(
              padEnds: false,
              physics: AlwaysScrollableScrollPhysics(),
              controller: PageController(
                viewportFraction: 0.7,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return FrostedGlassContainer(
                  height: 0,
                  color: Colors.amber,
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        minVerticalPadding: 0,
                        leading: Icon(
                          Icons.pie_chart_outline,
                          color: Colors.blue,
                        ),
                        title: Text(
                          "Asset Ticker",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        minVerticalPadding: 0,
                        title: Text(
                          "\$100,000",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          "Profit \u2191%28",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          //
          SizedBox(
            height: 30,
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              ///
              Text(
                "View More",
              ),
            ],
          ),

          ///
          ...List.generate(100, (index) {
            return ListTile(
              contentPadding: EdgeInsets.all(8),
              leading: Text("\u20BF"),
              title: Text(
                'BTC $index',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              subtitle: Text("Bitcoin"),
              trailing: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    "\$10,000,000,000",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    semanticsLabel: "step count",
                    style: TextStyle(
                      color: Color.fromRGBO(82, 82, 82, 1),
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Text(
                    "steps",
                    semanticsLabel: "step",
                    maxLines: 1,
                    style: TextStyle(
                      color: Color.fromRGBO(82, 82, 82, 1),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
              onTap: () {},
            );
          }),
          ListTile(
            contentPadding: EdgeInsets.all(8),
            leading: Text("\u20BF"),
            title: const Text(
              'BTC',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            subtitle: Text("Bitcoin"),
            trailing: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  "\$10,000,000,000", // textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  semanticsLabel: "step count",
                  style: const TextStyle(
                    color: Color.fromRGBO(82, 82, 82, 1),
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const Text(
                  "steps",
                  semanticsLabel: "step",
                  // textAlign: TextAlign.right,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color.fromRGBO(82, 82, 82, 1),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class FrostedGlassContainer extends StatelessWidget {
  final double height;
  final Widget? child;
  final Color color;
  final VoidCallback? onTap;

  const FrostedGlassContainer({
    super.key,
    required this.height,
    this.child,
    this.color = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 0,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withValues(alpha: 0.5),
                  color.withValues(alpha: 0.4),
                  color.withValues(alpha: 0.3),
                  color.withValues(alpha: 0.2),
                  color.withValues(alpha: 0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

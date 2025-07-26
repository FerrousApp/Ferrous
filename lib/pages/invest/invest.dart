import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/pages/portfolio/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        padding: const EdgeInsets.all(16.0),
        children: [
          //chart box
          Container(
            height: AppSizing.height(context) * 0.35,
            margin: EdgeInsets.only(
              bottom: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.amber,
              ),
            ),
          ),

          ///
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PortfolioPage(),
                ),
              );
            },
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///
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
                        "View all your holdings here",
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

          ///
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("data"),
                ),
              ),
              //
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("data"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

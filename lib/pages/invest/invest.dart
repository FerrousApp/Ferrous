import 'package:ferrous/pages/balance/balance.dart';
import 'package:ferrous/pages/events/events.dart';
import 'package:ferrous/pages/invest/components/quickaction_invest_tile.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ferrous/pages/portfolio/portfolio.dart';

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
            color: Colors.amber,
          ),
        ),
      ),

      ///
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ///
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              ///
              if (index == 0) {
                return QuickActionInvestTile(
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
                return QuickActionInvestTile(
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
              if (index == 2) {
                return QuickActionInvestTile(
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

              return QuickActionInvestTile(
                onTap: () {},
                color: Colors.brown,
                icon: Icon(Icons.request_quote_outlined),
                title: "",
                subtitle: "",
              );
            },
          ),

          /// Insert tab bar view here
        ],
      ),
    );
  }
}

class PortfolioLineChart extends StatefulWidget {
  const PortfolioLineChart({super.key});

  @override
  State<PortfolioLineChart> createState() => _PortfolioLineChartState();
}

class _PortfolioLineChartState extends State<PortfolioLineChart> {
  int selectedRange = 3; // 0: 1D, 1: 1W, 2: 1M, 3: 3M, 4: 1Y, 5: ALL
  int? touchedIndex;

  final List<String> ranges = ['1D', '1W', '1M', '3M', '1Y', 'ALL'];

  final List<List<FlSpot>> chartData = [
    // 1D
    [
      FlSpot(0, 300),
      FlSpot(1, 350),
      FlSpot(2, 320),
      FlSpot(3, 340),
      FlSpot(4, 330)
    ],
    // 1W
    [
      FlSpot(0, 300),
      FlSpot(1, 400),
      FlSpot(2, 600),
      FlSpot(3, 500),
      FlSpot(4, 700),
      FlSpot(5, 800),
      FlSpot(6, 900)
    ],
    // 1M
    [
      FlSpot(0, 300),
      FlSpot(1, 500),
      FlSpot(2, 900),
      FlSpot(3, 700),
      FlSpot(4, 600),
      FlSpot(5, 800),
      FlSpot(6, 730.36),
      FlSpot(7, 600),
      FlSpot(8, 700)
    ],
    // 3M
    [
      FlSpot(0, 300),
      FlSpot(1, 900),
      FlSpot(2, 600),
      FlSpot(3, 700),
      FlSpot(4, 900),
      FlSpot(5, 800),
      FlSpot(6, 900),
      FlSpot(7, 600),
      FlSpot(8, 800),
      FlSpot(9, 900)
    ],
    // 1Y
    [
      FlSpot(0, 300),
      FlSpot(1, 400),
      FlSpot(2, 500),
      FlSpot(3, 600),
      FlSpot(4, 700),
      FlSpot(5, 800),
      FlSpot(6, 900),
      FlSpot(7, 850),
      FlSpot(8, 900),
      FlSpot(9, 950)
    ],
    // ALL
    [
      FlSpot(0, 300),
      FlSpot(1, 350),
      FlSpot(2, 400),
      FlSpot(3, 450),
      FlSpot(4, 500),
      FlSpot(5, 600),
      FlSpot(6, 700),
      FlSpot(7, 800),
      FlSpot(8, 900),
      FlSpot(9, 1000)
    ],
  ];

  List<Color> gradientColors = [
    const Color(0xFF7FBCFB),
    const Color(0xFFB294FA),
    const Color(0xFFFBC2EB),
  ];

  @override
  Widget build(BuildContext context) {
    final spots = chartData[selectedRange];
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8.0, right: 8, left: 8, bottom: 8),
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 10000,
                gridData: FlGridData(show: true, drawVerticalLine: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 48,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('\$${value.toInt()}',
                                style: TextStyle(
                                    fontWeight: value == 3000
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: value == 3000
                                        ? Colors.black
                                        : Colors.grey)),
                          );
                        }),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    gradient: LinearGradient(colors: gradientColors),
                    barWidth: 4,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: gradientColors
                            .map((c) => c.withOpacity(0.15))
                            .toList(),
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, bar, index) {
                        final isSelected = touchedIndex == index;
                        return FlDotCirclePainter(
                          radius: isSelected ? 7 : 5,
                          color: isSelected ? Colors.black : Colors.white,
                          strokeWidth: 3,
                          strokeColor: isSelected
                              ? Colors.black
                              : Colors.deepPurple.shade100,
                        );
                      },
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((touchedSpot) {
                        return LineTooltipItem(
                          '\$${touchedSpot.y.toStringAsFixed(2)}',
                          const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        );
                      }).toList();
                    },
                  ),
                  touchCallback: (event, response) {
                    if (response != null &&
                        response.lineBarSpots != null &&
                        response.lineBarSpots!.isNotEmpty) {
                      setState(() {
                        touchedIndex = response.lineBarSpots!.first.spotIndex;
                      });
                    } else {
                      setState(() {
                        touchedIndex = null;
                      });
                    }
                  },
                  handleBuiltInTouches: true,
                ),
              ),
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
            ),
          ),
        ),

        ///
        SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              ranges.length,
              (i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: ChoiceChip(
                  label: Text(ranges[i]),
                  selected: selectedRange == i,
                  onSelected: (_) => setState(() => selectedRange = i),
                  selectedColor: Colors.black,
                  labelStyle: TextStyle(
                    color: selectedRange == i ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.transparent,
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: selectedRange == i
                          ? Colors.black
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

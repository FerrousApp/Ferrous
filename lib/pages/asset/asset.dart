import 'package:ferrous/misc/appsizing.dart';
import 'package:ferrous/misc/demo_data.dart';
import 'package:ferrous/pages/asset/aProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetDetailPage extends StatefulWidget {
  final DemoAssetData assetData;

  const AssetDetailPage({super.key, required this.assetData});

  @override
  State<AssetDetailPage> createState() => _AssetDetailPageState();
}

class _AssetDetailPageState extends State<AssetDetailPage> {
  final TextEditingController amountController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.unfocus();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blueAccent,
        title: ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.zero,

          ///
          title: Text(
            widget.assetData.ticker,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          ///
          subtitle: Text(
            widget.assetData.name,
            style: TextStyle(
              color: Colors.amber,
            ),
          ),

          trailing: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AssetProviderDetailPage(
                    assetData: widget.assetData,
                  ),
                ),
              );
            },
            child: Image.asset(
              widget.assetData.logo,
              height: 40,
              width: 40,
            ),
          ),
        ),

        ///
        flexibleSpace: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //TODO: invert in light mode
                Colors.amber.withValues(alpha: 0.5),
                Colors.amber.withValues(alpha: 0.3),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),

      ///
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          ///
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {},

            ///
            title: Text(
              "Asset Value",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),

            subtitleTextStyle: Theme.of(context).textTheme.titleLarge,

            /// asset value
            subtitle: Text(
              // "\u20A6${widget.assetData.position}",
              "\u20A69,000",
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            /// 24hr price action
            trailing: Text(
              "\u2191 24",
              style: TextStyle(color: Colors.green),
            ),
          ),

          ///
          Text(
            // "Subscribing to this asset yields ${widget.assetData.returnOnInvestment} apy",
            "Subscribing to this asset offers an annual yield of  ${widget.assetData.returnOnInvestment}",
            // maxLines: 1,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),

          ///
          SizedBox(
            height: AppSizing.height(context) * 0.1,
          ),

          ///
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: amountController,
                      focusNode: focusNode,
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d*')),
                      ],
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        // letterSpacing: 32,
                      ),
                      decoration: InputDecoration(
                        hintText: "10.00",
                        // hintText: "\u20A6200",
                        prefixIcon: Text(
                          // "₦",
                          "\u20A6",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        // prefixIcon: Icon(Icons.ac_unit),

                        counter: Offstage(),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: InputBorder.none,
                        // enabledBorder: InputBorder.none,
                      ),
                      onTapOutside: (value) {
                        focusNode.unfocus();
                      },
                    ),
                  ],
                ),
              ),

              ///
              Flexible(
                flex: 2,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.amber,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("\u20A6"),
                        Text(
                          "NGN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// for value of hbar you are getting
          Text(
            "0 ${widget.assetData.ticker}",
            style: TextStyle(
              height: 3,
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          SizedBox(
            height: AppSizing.height(context) * 0.1,
          ),

          ///
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     vertical: AppSizing.height(context) * 0.03,
          //   ),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     // crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       ListTile(
          //         title: Text(
          //           "0",
          //           textAlign: TextAlign.center,
          //         ),
          //         subtitle: Text(
          //           widget.assetData.ticker,
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //       ListTile(
          //         title: Text(
          //           "0",
          //           textAlign: TextAlign.center,
          //         ),
          //         subtitle: Text(
          //           "NGN",
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          ///
          // ListTile(
          //   title: Text("data"),
          //   subtitle: Text("data"),
          // ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 36,
                  ),
                ),
                child: const Text(
                  "Redeem",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              ///
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 36,
                  ),
                ),
                child: const Text(
                  "Subscribe",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: AppSizing.height(context) * 0.09,
          ),
        ],
      ),

      ///
      bottomSheet: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //TODO: invert in light mode
              Colors.amber.withValues(alpha: 0.3),
              Colors.amber.withValues(alpha: 0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListTile(
          title: Text(
            "\u20A61 = 0.01 ${widget.assetData.ticker}",
            style: TextStyle(
              // color: Colors.grey,
              fontSize: 13,
            ),
          ),
          subtitle: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Powered by ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: widget.assetData.providerName,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          trailing: Icon(Icons.question_mark_outlined),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SubscribeAssetCard extends StatefulWidget {
  const SubscribeAssetCard({super.key});

  @override
  State<SubscribeAssetCard> createState() => _SubscribeAssetCardState();
}

class _SubscribeAssetCardState extends State<SubscribeAssetCard> {
  final TextEditingController emailController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.unfocus();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Amount + Currency
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            ///
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    focusNode: focusNode,
                    keyboardType: TextInputType.number,
                    maxLength: 9,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      // letterSpacing: 32,
                    ),
                    decoration: InputDecoration(
                      hintText: "e.g \u20A6200",
                      counter: Offstage(),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
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
              flex: 3,
              child: InkWell(
                onTap: () {},
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

        ///
        Text(
          "109 HBAR",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),

        // const SizedBox(height: 30),
        Spacer(),

        // sub button
        Center(
          child: TextButton(
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // const SizedBox(height: 20),
        Spacer(),

        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "1 HBAR = \u20A63,163.20",
            style: TextStyle(
              color: Colors.grey,
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
                  ),
                ),
                TextSpan(
                  text: "Hedera",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.info_outline),
          ),
        ),
      ],
    );
  }
}

class RedeemAssetCard extends StatefulWidget {
  const RedeemAssetCard({super.key});

  @override
  State<RedeemAssetCard> createState() => _RedeemAssetCardState();
}

class _RedeemAssetCardState extends State<RedeemAssetCard> {
  final TextEditingController emailController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.unfocus();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(
          color: Colors.red,
        ),
      ),

      ///
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Amount + Currency
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              ///
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      focusNode: focusNode,
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        // letterSpacing: 32,
                      ),
                      decoration: InputDecoration(
                        hintText: "e.g \u20A6200",
                        counter: Offstage(),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
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
                flex: 3,
                child: InkWell(
                  onTap: () {},
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

          ///
          Text(
            "109 HBAR",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),

          // const SizedBox(height: 30),
          Spacer(),

          // sub button
          Center(
            child: TextButton(
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // const SizedBox(height: 20),
          Spacer(),

          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "1 HBAR = \u20A63,163.20",
              style: TextStyle(
                color: Colors.grey,
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
                    ),
                  ),
                  TextSpan(
                    text: "Hedera",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline),
            ),
          ),
        ],
      ),
    );
  }
}

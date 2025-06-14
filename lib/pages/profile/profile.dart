import 'package:ferrous/misc/appsizing.dart';

import 'package:flutter/material.dart';

// TODO: fix  me still

List<DetailRow> detailed = [
  DetailRow(title: "First Name", value: "Obiajulu"),
  DetailRow(title: "Middle Name", value: ""),
  DetailRow(title: "Last Name", value: "Mbanefo"),
  DetailRow(title: "Date of birth", value: "02/04/2003"),
  DetailRow(title: "Phone Number", value: "7050940544"),
];

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = AppSizing.width(context) < 600;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),

      ///
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 6 : 12,
          vertical: 6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                radius: 30,
                child: Text(
                  "OM",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                "Obiajulu Mbanefo",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("adamant@potato.com"),
            ),

            ///
            const SizedBox(height: 30),

            ///
            const Text(
              "PERSONAL DETAILS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            ///
            const SizedBox(height: 10),

            ///
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: detailed.length,
                  itemBuilder: (context, index) => detailed[index],
                ),
              ),
            ),

            ///
            const SizedBox(height: 30),
            const Text(
              "FERROUS ID",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),

            ///

            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                onTap: () {},
                title: Text(
                  "Your ION Identity",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle:
                    Text("Create a unique identity to interact with Ferrous"),
                trailing: CircleAvatar(
                  child: Text(
                    "\u{1F71D}",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Close account logic
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                child: const Text("Close Account"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// this is just fine, do not try to change to list tile
class DetailRow extends StatelessWidget {
  final String title;
  final String value;

  const DetailRow({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

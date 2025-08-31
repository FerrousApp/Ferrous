import 'package:ferrous/global/components/details_row.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          minVerticalPadding: 0,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            "Obiajulu Mbanefo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "obiajulu@ferrous.app",
            style: TextStyle(
              color: Colors.amber,
              // fontWeight: FontWeight.bold,
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
        padding: const EdgeInsets.all(12.0),
        children: [
          ///
          const Text(
            "Personal Details",
            style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          for (final detail in detailed)
            ListTile(
              onTap: () {},
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              title: Text(detail.title),
              trailing: Text(detail.value),
            ),

          ///
          const SizedBox(height: 30),

          ///TODO: pay a one time fee for a ferrous id
          const Text(
            "ION Points",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),

          ///
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(20),
              tileColor: Colors.amber.withValues(alpha: 0.2),
              title: Text(
                "Get Rewarded!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Earn up to \$1000 for completing tasks",
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.amber.withValues(alpha: 0.5),
                child: Text(
                  "\u{1F71D}",
                ),
              ),
              onTap: () {},
            ),
          ),

          ///
          const SizedBox(height: 30),

          ///
          Center(
            child: TextButton.icon(
              onPressed: () {
                // Close account logic
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              icon: Icon(Icons.delete_forever_outlined),
              label: const Text("Close Account"),
            ),
          ),
        ],
      ),
    );
  }
}

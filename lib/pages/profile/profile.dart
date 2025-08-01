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
            ),
          ),
        ),
      ),

      ///
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // ListTile(
          //   contentPadding: EdgeInsets.zero,
          //   leading: const CircleAvatar(
          //     radius: 30,
          //     child: Text(
          //       "OM",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          //   title: Text(
          //     "Obiajulu Mbanefo",
          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //   ),
          //   subtitle: Text("adamant@potato.com"),
          // ),

          ///
          // const SizedBox(height: 30),

          ///
          const Text(
            "Personal Details",
            style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          ///
          // const SizedBox(height: 10),

          ///
          // Card(
          //   elevation: 0,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(
          //       16,
          //     ),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(16),
          //     child: ListView.builder(
          //       padding: EdgeInsets.zero,
          //       shrinkWrap: true,
          //       itemCount: detailed.length,
          //       itemBuilder: (context, index) => detailed[index],
          //     ),
          //   ),
          // ),

          for (final detail in detailed)
            ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              title: Text(detail.title),
              trailing: Text(detail.value),
            ),

          ///
          const SizedBox(height: 30),

          ///TODO: pay a one time fee for a ferrous id
          const Text(
            "Ferrous ID",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          // const SizedBox(height: 10),

          ///

          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(20),
              onTap: () {},
              title: Text(
                "Your ION Identity",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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
                // backgroundColor: Colors.transparent,
                // shadowColor: Colors.transparent,
                // elevation: 0,
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

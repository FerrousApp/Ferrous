import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        ///
        title: Text(
          'Events',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list_outlined,
            ),
          ),

          ///
          SearchAnchor(
            dividerColor: Colors.amber,
            builder: (context, controller) => Padding(
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.search,
                color: Colors.amber,
              ),
            ),
            suggestionsBuilder: (context, controller) =>
                const Iterable<Widget>.empty(),
          ),
        ],
      ),

      ///
      body: Center(
        child: Text(
          'No action has been taken yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

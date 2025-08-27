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
        ///
        title: Text(
          'Events',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
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

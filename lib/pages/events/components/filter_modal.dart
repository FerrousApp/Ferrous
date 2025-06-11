import 'package:ferrous/pages/events/components/filter_date_picker.dart';
import 'package:flutter/material.dart';

//TODO: get currencies unicode
class FilterModal extends StatelessWidget {
  const FilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    // todo: change to list view
    return SingleChildScrollView(
      padding: MediaQuery.of(context).viewInsets.add(
            const EdgeInsets.symmetric(
              horizontal: 6,
              // vertical: 2,
            ),
          ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Filter by",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.highlight_remove_outlined,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),

          // Currency Filter
          Text(
            "Currency",
            style: TextStyle(height: 2),
          ),
          // const SizedBox(height: 8),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text("Show all"),
                  selected: true,
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: Text("USD 🇺🇸"),
                  selected: false,
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: Text("GBP 🇬🇧"),
                  selected: false,
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: Text("EUR 🇪🇺"),
                  selected: false,
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: Text("NGN 🇳🇬"),
                  selected: false,
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: Text("Ethereum \u{039E}"),
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Transaction Type
          Text(
            "Transaction type",
            style: TextStyle(height: 2),
          ),
          // const SizedBox(height: 8),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text("Show all"),
                  selected: true,
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: Text("Deposit"),
                  selected: false,
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: Text("Withdraw"),
                  selected: false,
                  onSelected: (value) {},
                ),
                FilterChip(
                  label: Text("Convert"),
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Date filter (basic UI)
          FilterSheetDatePicker(),

          const SizedBox(height: 20),

          /// filter button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                ),
                iconAlignment: IconAlignment.end,
                icon: const Icon(Icons.filter_list_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text(
                  'Apply Filter',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

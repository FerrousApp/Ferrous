import 'dart:developer';

import 'package:flutter/material.dart';

class FilterSheetDatePicker extends StatefulWidget {
  const FilterSheetDatePicker({super.key});

  @override
  State<FilterSheetDatePicker> createState() => _FilterSheetDatePickerState();
}

class _FilterSheetDatePickerState extends State<FilterSheetDatePicker> {
  DateTime? _fromDate;
  DateTime? _toDate;
  TextEditingController _toDateContoller = TextEditingController();

  Future<void> _pickDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          isFrom ? (_fromDate ?? DateTime.now()) : (_toDate ?? DateTime.now()),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      if (_toDate != null && _fromDate != null) {
        // if the to date is before the from date
        if (_fromDate!.isAfter(_toDate!)) {
          log("from date is after to date");
        }
        // Your logic here
      }
      setState(() {
        if (isFrom) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });

      print(picked);
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')} / ${date.month.toString().padLeft(2, '0')} / ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          key: ValueKey("from"),
          child: TextField(
            readOnly: true,
            onTap: () => _pickDate(context, true),
            decoration: InputDecoration(
              hintText: _fromDate == null
                  ? "From DD / MM / YY"
                  : _formatDate(_fromDate),
              prefixIcon: const Icon(Icons.calendar_today),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          key: ValueKey("to"),
          child: TextField(
            readOnly: true,
            onTap: () => _pickDate(context, false),
            controller: _toDateContoller,
            decoration: InputDecoration(
              hintText:
                  _toDate == null ? "To DD / MM / YY" : _formatDate(_toDate),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }
}

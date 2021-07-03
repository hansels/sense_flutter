import 'package:flutter/material.dart';
import 'package:sense_flutter/functions/date_parser.dart';

class DatePickerNormalFormField extends StatefulWidget {
  final String labelText;
  final DateTime initialDate;
  final FocusNode focusNode;
  final void Function(DateTime) onChanged;
  final bool isRemoveable;
  final DateTime firstDate;
  final DateTime lastDate;
  final double withDivider;

  DatePickerNormalFormField({
    this.labelText,
    this.initialDate,
    this.focusNode,
    @required this.onChanged,
    this.isRemoveable = true,
    this.firstDate,
    this.lastDate,
    this.withDivider = 1,
  });

  @override
  _DatePickerNormalFormFieldState createState() =>
      _DatePickerNormalFormFieldState();
}

class _DatePickerNormalFormFieldState extends State<DatePickerNormalFormField> {
  DateTime dateTime;

  @override
  void initState() {
    dateTime = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / widget.withDivider,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () async {
              dateTime = await showDatePicker(
                context: context,
                initialDate: dateTime ?? DateTime.now(),
                firstDate: widget.firstDate ?? DateTime(2021),
                lastDate: widget.lastDate ?? DateTime(2099),
              );
              if (dateTime != null) {
                setState(() {});
                widget.onChanged(dateTime);
              }
            },
            child: Container(
              height: 60,
              color: Colors.transparent,
              child: IgnorePointer(
                child: TextField(
                  controller: TextEditingController(
                    text: DateParser.parseDate(dateTime),
                  ),
                  readOnly: true,
                  decoration: InputDecoration(labelText: widget.labelText),
                  style: const TextStyle(fontSize: 16),
                  focusNode: widget.focusNode,
                ),
              ),
            ),
          ),
          if (dateTime != null && widget.isRemoveable)
            Positioned(
              right: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    dateTime = null;
                  });
                  widget.onChanged(null);
                },
                child: Container(
                  height: 50,
                  width: 40,
                  child: Center(
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

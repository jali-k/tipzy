import 'package:flutter/material.dart';

class DynamicWidgetDropdown extends StatefulWidget {
  final List<String> dropdownItems;
  final Widget Function(String) widgetBuilder;

  const DynamicWidgetDropdown({
    Key? key,
    required this.dropdownItems,
    required this.widgetBuilder,
  }) : super(key: key);

  @override
  State<DynamicWidgetDropdown> createState() => _DynamicWidgetDropdownState();
}

class _DynamicWidgetDropdownState extends State<DynamicWidgetDropdown> {
  String _selectedValue = '';

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.dropdownItems.first; // Set initial selection
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: _selectedValue,
          items: widget.dropdownItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue!;
            });
          },
        ),
        widget.widgetBuilder(_selectedValue), // Build the dynamic widget
      ],
    );
  }
}

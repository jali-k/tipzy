import 'package:flutter/material.dart';

// enum ImageAction {
//   uploadImage(String title),
//   pasteUrl(String title);

//   final String title;

//   const ImageAction(this.title);
// }

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
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: DropdownButton<String>(
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
        ),
        widget.widgetBuilder(_selectedValue), // Build the dynamic widget
      ],
    );
  }
}

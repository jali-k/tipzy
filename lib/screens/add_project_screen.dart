import 'package:flutter/material.dart';
import 'package:tipzy/widgets/dynamic_widget_dropdown.dart';

class AddProjectScreen extends StatefulWidget {
  AddProjectScreen({super.key});
  final List<String> dropdownItems = ["upload", "pasteLink"];

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  String _selectedValue = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedValue = widget.dropdownItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Project"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  maxLines: null, // Allows for multiline input
                  textAlign: TextAlign.left, // Change alignment as needed
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your project title here...',
                    // You can also customize other properties of the input decoration
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  maxLines: null, // Allows for multiline input
                  textAlign: TextAlign.left, // Change alignment as needed
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your project description here...',
                    // You can also customize other properties of the input decoration
                  ),
                ),
              ),
              SizedBox(height: 20),
              DynamicWidgetDropdown(
                dropdownItems: widget.dropdownItems,
                widgetBuilder: (selectedValue) {
                  switch (selectedValue) {
                    case 'upload':
                      return Text('This is the content for Option 1');
                    case 'pasteLink':
                      return ElevatedButton(
                          onPressed: () {}, child: Text('Button for Option 2'));

                    default:
                      return SizedBox(); // Handle unexpected selection
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Add Project"),
              ),
            ],
          ),
        ));
  }
}

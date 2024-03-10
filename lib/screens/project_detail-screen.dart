import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  const ProjectDetailsScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Hero(child: Image.network(widget.imageUrl), tag: "project image"),
            SizedBox(height: 20),
            Text(widget.description),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5),
              Hero(child: Image.network(widget.imageUrl), tag: "project image"),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Text(widget.description),
                      )),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text("Subscribe to the project"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

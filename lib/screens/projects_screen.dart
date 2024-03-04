import 'package:flutter/material.dart';
import 'package:tipzy/widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ProjectCard(
              title: "Test ML Project",
              description:
                  "This is an ML project, that enhance the deference between supervised and unsupervised learning.",
              imageUrl: 'https://picsum.photos/300/300',
            ),
          ],
        ),
      );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tipzy/providers/user_provider.dart';
import 'package:tipzy/screens/project_detail-screen.dart';
import 'package:tipzy/widgets/project_card.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text("You are, ${ref.watch(userProvider)?.email.toString()}"),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProjectDetailsScreen(
                          title: "Test ML Project",
                          description:
                              "This is an ML project, that enhance the deference between supervised and unsupervised learning. This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.This is an ML project, that enhance the deference between supervised and unsupervised learning.",
                          imageUrl: 'https://picsum.photos/300/300')));
            },
            child: ProjectCard(
              title: "Test ML Project",
              description:
                  "This is an ML project, that enhance the deference between supervised and unsupervised learning.",
              imageUrl: 'https://picsum.photos/300/300',
            ),
          ),
        ],
      ),
    );
  }
}

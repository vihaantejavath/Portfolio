import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';
import '../widgets/project_widget.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects = [
    Project(
      imageUrl: 'assets/images/Camp.png',
      title: 'Campus Sports Management Mobile Application',
      description:
          'Designed in Figma and developed an Android app using Flutter for college sports management, featuring QR code attendance and Firebase for real-time data and authentication.',
      techStack: 'Flutter, Android Studio, Figma, Firebase',
      githubLink: 'https://github.com/vihaantejavath/backimage',
    ),
    Project(
      imageUrl: 'assets/images/Gdeck.png',
      title: 'G Deck Web Application',
      description:
          'Conducted extensive UX research for a gaming website, focusing on user-friendly navigation and detailed reviews. Currently working on wireframing and design in Figma to enhance user experience.',
      techStack: 'Figma, UX Research',
      githubLink: '',
    ),
    Project(
      imageUrl: 'assets/images/Daytasker.png',
      title: 'DayTasker Mobile Application',
      description:
          'Developed Daytasker, a task management app enabling efficient organization with task prioritization, due dates, and cloud synchronization via AWS. \n Under Development for UI changes',
      techStack: 'Flutter, Firebase, VsCode',
      githubLink: 'https://github.com/vihaantejavath/DayTasker',
    ),
  ];

  Future<void> launchUrl(Uri url) async {
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Projects',
            style: TextStyle(
              color: Color(0xFF8FC1E3),
              fontSize: 32,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.40,
            ),
          ),
          SizedBox(height: 10),
          _buildProjects(context),
        ],
      ),
    );
  }

  Widget _buildProjects(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth > 600;

    return isLargeScreen
        ? _buildProjectsGrid()
        : _buildProjectsList();
  }

  Widget _buildProjectsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectWidget(project: projects[index], launchUrl: launchUrl);
      },
    );
  }

  Widget _buildProjectsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectWidget(project: projects[index], launchUrl: launchUrl);
      },
    );
  }
}

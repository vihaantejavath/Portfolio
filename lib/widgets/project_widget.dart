import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectWidget extends StatelessWidget {
  final Project project;
  final Function(Uri) launchUrl;

  const ProjectWidget({required this.project, required this.launchUrl});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetWidth = screenWidth > 600 ? screenWidth / 3 - 20 : screenWidth - 40;

    return Container(
      width: widgetWidth,
      margin: EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Color(0xFF363535),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: Color.fromARGB(83, 50, 47, 47),
            blurRadius: 50,
            offset: Offset(2, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: widgetWidth * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(project.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  project.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 125, 193, 189),
                    fontSize: widgetWidth * 0.05,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  project.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: widgetWidth * 0.035,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'Tech Stack: ',
                    style: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontSize: widgetWidth * 0.03,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: project.techStack,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                if (project.githubLink.isNotEmpty)
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Open GitHub link
                        launchUrl(Uri.parse(project.githubLink));
                      },
                      icon: Image.asset(
                        'assets/logos/GitHub.png',
                        width: 26,
                        height: 26,
                      ),
                      label: Text(
                        'View Code',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: widgetWidth * 0.04,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF212A31)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

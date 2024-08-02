import 'package:flutter/material.dart';
import 'package:portfolio/models/tech.dart';
import 'package:portfolio/widgets/techwidget.dart';

class TechStackSection extends StatelessWidget {
  final List<TechInfo> techInfo = [
    TechInfo(name: 'Figma', logoPath: 'assets/logos/figma.png'),
    TechInfo(name: 'Illustrator', logoPath: 'assets/logos/Illustrator.png'),
    TechInfo(name: 'Android', logoPath: 'assets/logos/android.png'),
    TechInfo(name: 'Flutter', logoPath: 'assets/logos/Flutter.png'),
    TechInfo(name: 'Dart', logoPath: 'assets/logos/Dart.png'),
    TechInfo(name: 'Autodesk', logoPath: 'assets/logos/Autodesk.png'),
    TechInfo(name: 'AWS', logoPath: 'assets/logos/AWS.png'),
    TechInfo(name: 'Amplify', logoPath: 'assets/logos/amplify.png'),
    TechInfo(name: 'Android Studio', logoPath: 'assets/logos/Android_Studio.png'),
    TechInfo(name: 'Git', logoPath: 'assets/logos/Git.png'),
    TechInfo(name: 'GitHub', logoPath: 'assets/logos/GitHub.png'),
    TechInfo(name: 'VS Code', logoPath: 'assets/logos/VsCode.png'),
    TechInfo(name: 'HTML', logoPath: 'assets/logos/HTML.png'),
    TechInfo(name: 'CSS', logoPath: 'assets/logos/CSS.png'),
    TechInfo(name: 'JS', logoPath: 'assets/logos/JS.png'),
    TechInfo(name: 'Python', logoPath: 'assets/logos/Python.png'),
    TechInfo(name: 'C', logoPath: 'assets/logos/C.png'),
    TechInfo(name: 'MySQL', logoPath: 'assets/logos/MySQL.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Color(0xFF212A31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'My Tech Stack',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Color(0xFF5AB9EA),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Tools and Technologies in My Skillset',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(height: 30),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 6 : 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 2,
              ),
              itemCount: techInfo.length,
              itemBuilder: (context, index) {
                return TechWidget(techInfo: techInfo[index]);
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

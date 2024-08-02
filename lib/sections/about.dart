import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double horizontalPadding = screenWidth * 0.1;
    double verticalPadding = 40;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: TextStyle(
                color: Color(0xFF5AB9EA),
                fontSize: screenWidth < 600 ? 24 : 32,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.40,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
              child: Text(
                'I am deeply immersed in the world of full-stack web development, specializing in HTML, CSS, JavaScript, and mobile app development using Flutter. Alongside, I am venturing into UX design, refining my skills in user research, design thinking, and prototyping. Proficient in tools like Figma and Canva, I enjoy crafting user interfaces that are not only visually engaging but also intuitive. Through internships and personal projects, I\'ve cultivated a passion for creating seamless experiences that enhance user satisfaction and drive business success. I am eager to apply my skills in a professional setting where creativity, collaboration, and continuous learning thrive, contributing meaningfully to innovative projects. Let\'s connect to discuss how my enthusiasm and dedication can benefit your team\'s objectives.',
                style: TextStyle(
                  color: Color(0xFFD3D9D4),
                  fontSize: screenWidth < 600 ? 14 : 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle(screenWidth, 'Education'),
                SizedBox(height: 20),
                _buildEducationList(),
              ],
            ),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle(screenWidth, 'Certifications'),
                SizedBox(height: 20),
                _buildCertificationsList(),
              ],
            ),
            SizedBox(height: 40),
            _buildSectionTitle(screenWidth, 'Work Experience'),
            SizedBox(height: 20),
            _buildWorkExperience(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(double screenWidth, String title) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFF5AB9EA),
        fontSize: screenWidth < 600 ? 24 : 32,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        letterSpacing: -0.40,
      ),
    );
  }

  Widget _buildEducationList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEducationItem(
          'B Tech in Smart Manufacturing',
          'IIITDM Kancheepuram, Chennai',
          'Aug 2020 - April 2024',
        ),
        SizedBox(height: 20),
        _buildEducationItem(
          '12th Standard',
          'Delhi Public School, Warangal',
          'June 2019 - May 2020',
        ),
      ],
    );
  }

  Widget _buildEducationItem(String title, String subTitle, String date) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        Icons.school,
        color: Color(0xFF8FC1E3),
        size: 36,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF8FC1E3),
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subTitle,
            style: TextStyle(
              color: Color(0xFFF7F9FB),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Color(0xFFF7F9FB),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCertificationItem(
          'Google UX Design Professional Certificate',
          'Coursera',
          'Dec 2023 - Present',
          'https://coursera.org/share/bab9465f8d9834e77d8754e9b9ed2cf2',
        ),
        SizedBox(height: 20),
        _buildCertificationItem(
          'AWS Badges',
          'AWS Educate',
          'June 2024 - July 2024',
          'https://www.credly.com/users/vihaan-tejavath',
        ),
      ],
    );
  }

  Widget _buildCertificationItem(String title, String subTitle, String date, String link) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        Icons.star,
        color: Color(0xFF8FC1E3),
        size: 36,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF8FC1E3),
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subTitle,
            style: TextStyle(
              color: Color(0xFFF7F9FB),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Color(0xFFF7F9FB),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              _openUrl(link);
            },
            icon: Icon(Icons.link),
            label: Text('Link'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5AB9EA)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkExperience() {
    return _buildExperienceItem(
      'Web Development Intern',
      'Technophilia',
      'Remote',
      'Aug 2023 - Sept 2023',
      'https://github.com/vihaantejavath/backimage',
    );
  }

  Widget _buildExperienceItem(
    String title, String company, String location, String date, String link) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        Icons.work,
        color: Color(0xFF8FC1E3),
        size: 36,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF8FC1E3),
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company,
            style: TextStyle(
              color: Color(0xFFF7F9FB),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            location,
            style: TextStyle(
              color: Color(0xFFF7F9FB),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Color(0xFFF7F9FB),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton.icon(
            onPressed: () {
              _openUrl(link);
            },
            icon: Icon(Icons.link),
            label: Text('Link'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5AB9EA)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _openUrl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}

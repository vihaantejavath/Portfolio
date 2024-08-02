import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return Container(
          color: Color(0xFF212A31),
          padding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 20 : 30,
            horizontal: isSmallScreen ? 20 : 100,
          ),
          child: isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImageSection(isSmallScreen),
                    SizedBox(height: 20),
                    _buildTextSection(isSmallScreen),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildTextSection(isSmallScreen)),
                    SizedBox(width: 40),
                    _buildImageSection(isSmallScreen),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildTextSection(bool isSmallScreen) {
    return Container(
      constraints: BoxConstraints(maxWidth: 900),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFF212A31),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, I\'m',
            style: TextStyle(
              color: Color(0xFFD3D9D4),
              fontSize: isSmallScreen ? 20 : 32,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Vihaan Tejavath',
            style: TextStyle(
              color: Color(0xFF66FCF1),
              fontSize: isSmallScreen ? 40 : 90,
              fontFamily: 'Sen',
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Passionate about crafting exceptional user experiences through full-stack web development and mobile applications. Proficient in HTML, CSS, JavaScript, and adept with design tools like Figma and Illustrator. Eager to contribute innovative solutions that merge technical excellence with user-centric design principles.',
            style: TextStyle(
              color: Colors.white,
              fontSize: isSmallScreen ? 14 : 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          _buildButtonSection(isSmallScreen),
        ],
      ),
    );
  }

  Widget _buildButtonSection(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () async {
                const url = 'https://linkedin.com/in/vihaan-tejavath';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.asset(
                'assets/logos/LinkedIn.png',
                width: 50,
                height: 50,
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () async {
                const url = 'https://github.com/vihaantejavath';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.asset(
                'assets/logos/GitHub.png',
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () async {
            const url =
                'https://drive.google.com/file/d/1Slthg3Hk1S2EIA-aDvNszkMAB-Yb4KFy/view?usp=drive_link';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          icon: Icon(Icons.download),
          label: Text('Resume'),
        ),
      ],
    );
  }

  Widget _buildImageSection(bool isSmallScreen) {
    return Container(
      width: isSmallScreen ? double.infinity : 600,
      height: isSmallScreen ? 300 : 600,
      margin: EdgeInsets.only(bottom: isSmallScreen ? 20 : 0, left: isSmallScreen ? 0 : 40),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/mypic.png"),
        ),
      ),
    );
  }
}

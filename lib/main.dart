import 'package:flutter/material.dart';
import 'package:portfolio/sections/about.dart';
import 'package:portfolio/sections/contact.dart';
import 'package:portfolio/sections/home.dart';
import 'package:portfolio/sections/projects.dart';
import 'package:portfolio/sections/tech_stack.dart';
import 'package:portfolio/widgets/navigation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ItemScrollController _scrollController = ItemScrollController();

  void _scrollToSection(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: NavBar(onButtonPressed: _scrollToSection),
      ),
      body: Container(
        color: Color(0xFF212A31),
        child: ScrollablePositionedList.builder(
          itemScrollController: _scrollController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: _buildSection(index),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSection(int index) {
    switch (index) {
      case 0:
        return HomeSection();
      case 1:
        return AboutSection();
      case 2:
        return ProjectsSection();
      case 3:
        return TechStackSection();
      case 4:
        return ContactSection();
      default:
        return Container();
    }
  }
}

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(int) onButtonPressed;

  NavBar({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF212A31),
      title: Text(
        'Design & Developer',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Sen',
          fontWeight: FontWeight.w200,
          fontSize: 24,
        ),
      ),
      actions: [
        if (MediaQuery.of(context).size.width > 600) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              onPressed: () => onButtonPressed(0),
              child: Text('Home', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500))
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              onPressed: () => onButtonPressed(1),
              child: Text('About', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500))
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              onPressed: () => onButtonPressed(2),
              child: Text('Projects', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500))
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              onPressed: () => onButtonPressed(3),
              child: Text('Tech Stack', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500))
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              onPressed: () => onButtonPressed(4), 
              child: Text('Contact', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500))
            ),
          ),
        ] else ...[
          PopupMenuButton<int>(
            onSelected: (index) {
              onButtonPressed(index);
            },
            icon: Icon(Icons.menu, color: Color.fromARGB(255, 145, 197, 212)),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text('Home'),
              ),
              PopupMenuItem(
                value: 1,
                child: Text('About'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Projects'),
              ),
              PopupMenuItem(
                value: 3,
                child: Text('Tech Stack'),
              ),
              PopupMenuItem(
                value: 4,
                child: Text('Contact'),
              ),
            ],
          )
        ],
      ],
    );
  }
}

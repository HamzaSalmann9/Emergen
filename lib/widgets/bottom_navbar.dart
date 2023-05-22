import 'dart:ui';
import 'package:flutter/material.dart';

class GlassBottomNavBar extends StatefulWidget {
  @override
  _GlassBottomNavBarState createState() => _GlassBottomNavBarState();
}

class _GlassBottomNavBarState extends State<GlassBottomNavBar> {
  int _currentIndex = 0;
  final List<IconData> _icons = [
    Icons.gamepad_outlined,
    Icons.search_outlined,
    Icons.bolt_outlined,
    Icons.settings_outlined,
    Icons.person_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4), // Adjust opacity as desired
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 10,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: _icons.map((icon) {
                return BottomNavigationBarItem(
                  icon: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (_currentIndex == _icons.indexOf(icon))
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .orange, // Replace with your desired color
                          ),
                        ),
                      Icon(
                        icon,
                        color: Colors
                            .black, // Replace with your desired icon color
                      ),
                    ],
                  ),
                  label: '',
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

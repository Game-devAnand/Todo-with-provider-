import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Responsive UI")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check width to determine layout
          if (constraints.maxWidth < 600) {
            // Small screen (mobile)
            return Column(
              children: [
                Expanded(child: buildItem(Colors.red, "Item 1")),
                Expanded(child: buildItem(Colors.green, "Item 2")),
                Expanded(child: buildItem(Colors.blue, "Item 3")),
              ],
            );
          } else {
            // Large screen (tablet or desktop)
            return Row(
              children: [
                Expanded(child: buildItem(Colors.red, "Item 1")),
                Expanded(child: buildItem(Colors.green, "Item 2")),
                Expanded(child: buildItem(Colors.blue, "Item 3")),
              ],
            );
          }
        },
      ),
    );
  }

  Widget buildItem(Color color, String text) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

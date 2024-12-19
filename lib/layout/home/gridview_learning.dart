import 'package:flutter/material.dart';

class GridviewLearning extends StatelessWidget {
  const GridviewLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Learning'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: const [
          Card(
            child: Center(child: Text('Item 1')),
          ),
          Card(
            child: Center(child: Text('Item 2')),
          ),
          Card(
            child: Center(child: Text('Item 3')),
          ),
          Card(
            child: Center(child: Text('Item 4')),
          ),
        ],
      ),
    );
  }
}

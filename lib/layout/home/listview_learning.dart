import 'package:flutter/material.dart';

class ListviewLearning extends StatelessWidget {
  const ListviewLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Learning'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Item 1'),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Item 2'),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Item 3'),
          ),
        ],
      ),
    );
  }
}

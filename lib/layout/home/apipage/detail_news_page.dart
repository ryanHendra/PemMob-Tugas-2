import 'package:flutter/material.dart';
import 'package:latihan/layout/model/Getnews.dart';

class Detailnewspage extends StatelessWidget {
  final Getnews getnews;

  const Detailnewspage({super.key, required this.getnews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('id: ${getnews.id}'),
            Text('Title: ${getnews.title}'),
            const Text('Body: '),
            Text(getnews.body),
          ],
        ),
      ),
    );
  }
}

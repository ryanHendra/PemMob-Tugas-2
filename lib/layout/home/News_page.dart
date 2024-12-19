import 'package:flutter/material.dart';
import 'package:latihan/layout/model/Getnews.dart'; // Pastikan Getnews sudah terdefinisi dengan benar
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'apipage/news_card.dart'; // Gunakan nama file sesuai konvensi lower_case_with_underscores

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  late Future<List<Getnews>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  Future<List<Getnews>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        var getPostsData = json.decode(response.body) as List;
        return getPostsData.map((i) => Getnews.fromJson(i)).toList();
      } else {
        throw Exception('Failed to load posts. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load posts: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FutureBuilder<List<Getnews>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No posts available'),
                );
              }

              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  var post = snapshot.data![index];
                  return Newscard(
                    getnews: Getnews(
                      id: post.id,
                      title: post.title,
                      body: post.body,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

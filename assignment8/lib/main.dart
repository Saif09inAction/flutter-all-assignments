import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ApiCacheApp());
}

class ApiCacheApp extends StatelessWidget {
  const ApiCacheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Cache App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C3CEB),
        ),
        useMaterial3: true,
      ),
      home: const PostsPage(),
    );
  }
}

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<dynamic> posts = [];
  bool isLoading = true;
  String dataSource = 'Loading...';

  final String apiUrl =
      'https://jsonplaceholder.typicode.com/posts';

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  // Load cached data first, otherwise fetch from API
  Future<void> loadPosts() async {
    final prefs = await SharedPreferences.getInstance();

    final cachedData = prefs.getString('cached_posts');

    if (cachedData != null) {
      setState(() {
        posts = jsonDecode(cachedData);
        dataSource = 'Data loaded from cache';
        isLoading = false;
      });
    } else {
      await fetchPostsFromApi();
    }
  }

  // Fetch fresh data from API
  Future<void> fetchPostsFromApi() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final fetchedPosts = jsonDecode(response.body);

        final prefs = await SharedPreferences.getInstance();

        // Save API response in cache
        await prefs.setString(
          'cached_posts',
          jsonEncode(fetchedPosts),
        );

        setState(() {
          posts = fetchedPosts;
          dataSource = 'Data fetched from API';
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('cached_posts');

      if (cachedData != null) {
        setState(() {
          posts = jsonDecode(cachedData);
          dataSource = 'Offline mode - Data loaded from cache';
          isLoading = false;
        });
      } else {
        setState(() {
          dataSource = 'Failed to load data';
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFF0EAF5),
        elevation: 0,
        title: const Text(
          'API Posts',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.black54,
              size: 26,
            ),
            onPressed: fetchPostsFromApi,
          ),
        ],
      ),

      body: Column(
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFFFF8FF),
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE0D9E3),
                ),
              ),
            ),
            child: Row(
              children: [
                // App icon
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6939E8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.api,
                    color: Colors.white,
                    size: 34,
                  ),
                ),

                const SizedBox(width: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'JSONPlaceholder Posts',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      dataSource,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Posts list
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : posts.isEmpty
                    ? const Center(
                        child: Text('No posts available'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];

                          return Container(
                            margin: const EdgeInsets.only(
                              bottom: 12,
                            ),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9F1FC),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: const Color(0xFFE1D8E5),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    // Post number
                                    Container(
                                      width: 42,
                                      height: 42,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFEDE0FF),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${post['id']}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF65418C),
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    // Post title
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(
                                          top: 8,
                                        ),
                                        child: Text(
                                          post['title']
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                                FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 14),

                                Text(
                                  post['body'].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Colors.black87,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  'User ID: ${post['userId']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
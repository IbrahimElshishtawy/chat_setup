import 'package:flutter/material.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _users = ['Alice', 'Bob', 'Charlie', 'David'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Users'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search for users...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _users
                  .where((user) => user
                      .toLowerCase()
                      .contains(_searchController.text.toLowerCase()))
                  .length,
              itemBuilder: (context, index) {
                final filteredUsers = _users
                    .where((user) => user
                        .toLowerCase()
                        .contains(_searchController.text.toLowerCase()))
                    .toList();
                final user = filteredUsers[index];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/40'),
                  ),
                  title: Text(user),
                  onTap: () {
                    // Navigate to user profile or start chat
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

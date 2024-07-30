import 'package:flutter/material.dart';
import 'dart:math';
import 'api_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Map<String, dynamic>> futureUser;

  @override
  void initState() {
    super.initState();
    int randomUserId = Random().nextInt(10) + 1;
    futureUser = ApiService.fetchUser(randomUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            var user = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(user),
                  SizedBox(height: 20),
                  _buildInfoCard('Personal Information', [
                    _buildInfoRow(Icons.person, 'Username', user['username']),
                    _buildInfoRow(Icons.phone, 'Phone', user['phone']),
                    _buildInfoRow(Icons.language, 'Website', user['website']),
                  ]),
                  SizedBox(height: 20),
                  _buildInfoCard('Address', [
                    _buildInfoRow(Icons.home, 'Street', user['address']['street']),
                    _buildInfoRow(Icons.apartment, 'Suite', user['address']['suite']),
                    _buildInfoRow(Icons.location_city, 'City', user['address']['city']),
                    _buildInfoRow(Icons.location_on, 'Zipcode', user['address']['zipcode']),
                  ]),
                  SizedBox(height: 20),
                  _buildInfoCard('Company', [
                    _buildInfoRow(Icons.business, 'Name', user['company']['name']),
                    _buildInfoRow(Icons.catching_pokemon, 'Catch Phrase', user['company']['catchPhrase']),
                  ]),
                  SizedBox(height: 20),
                ],
              ),
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }

  Widget _buildHeader(Map<String, dynamic> user) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Text(
              user['name'][0],
              style: TextStyle(fontSize: 40, color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 10),
          Text(
            user['name'],
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            user['email'],
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
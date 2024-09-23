import 'package:flutter/material.dart';
import 'WasteManagementInfoPage.dart';
import 'RaiseComplaintPage.dart';
import 'HelpSupportPage.dart';
import 'RecyclingTipsPage.dart';
import 'SettingsPage.dart';
import 'WasteSegregationPage.dart';
import 'SelectionPage.dart';
import 'loginpage.dart'; // Import the login page for logout redirection
import 'NGODrivePage.dart';

void main() {
  runApp(EcoSortApp());
}

class EcoSortApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoSort',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.green[700],
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white70, // Set AppBar text color to a lighter shade
          ),
          iconTheme: IconThemeData(
            color: Colors.green[300], // Set the default AppBar icon color
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
          elevation: 16.0,
        ),
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  String _currentTitle = 'Home'; // Default title

  // Function to select a page and update the title
  void _selectPage(Widget page, String title) {
    setState(() {
      _currentTitle = title;
    });
    _navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Function to handle logout
  void _handleLogout() {
    // Implement your logout logic here
    // Example: navigate to the LoginPage after logging out
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu,
                  color:
                      Colors.green[300]), // Manually set hamburger button color
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(_currentTitle, style: TextStyle(color: Colors.white70)),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white70),
            onPressed: _handleLogout,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.lightGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              accountName: Text(
                'EcoSort User',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50.0, color: Colors.green),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(Icons.home, 'Home',
                      SelectionPage(onPageSelected: _selectPage)),
                  _buildDrawerItem(Icons.camera_alt, 'Waste Segregation',
                      WasteSegregationPage()),
                  _buildDrawerItem(Icons.report_problem, 'Raise Complaint',
                      RaiseComplaintPage()),
                  _buildDrawerItem(Icons.info, 'Waste Management Info',
                      WasteManagementInfoPage()),
                  _buildDrawerItem(
                      Icons.recycling, 'Recycling Tips', RecyclingTipsPage()),
                  _buildDrawerItem(
                    Icons.volunteer_activism,
                    'NGO Drives',
                    NGODrivesPage(),
                  ),
                  const Divider(thickness: 1, height: 1),
                  _buildDrawerItem(Icons.settings, 'Settings', SettingsPage()),
                  _buildDrawerItem(
                      Icons.help, 'Help & Support', HelpSupportPage()),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => SelectionPage(onPageSelected: _selectPage),
          );
        },
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title, style: TextStyle(color: Colors.green[700])),
      onTap: () {
        _selectPage(page, title);
        Navigator.of(context).pop(); // Close the drawer after selection
      },
    );
  }
}

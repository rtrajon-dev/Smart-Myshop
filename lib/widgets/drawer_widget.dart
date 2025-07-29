// lib/widgets/drawer_widget.dart
import 'package:flutter/material.dart';
import 'package:myshop/screens/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';
import '../providers/theme_provider.dart';
import '../screens/favourites_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          //   child: Text(
          //     'MyShop Menu',
          //     style: TextStyle(color: Colors.white, fontSize: 24),
          //   ),
          // ),
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40,),
                ),
                SizedBox(height: 10),
                Text("Rajon Talukdar", style: TextStyle(color: Colors.white, fontSize: 18),),
                Text("rt@example.com", style: TextStyle(color: Colors.white70),),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => _navigateTo(context, HomeScreen()),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favourites'),
            onTap: () => _navigateTo(context, FavouritesScreen()),
            // onTap: () {
            //   Navigator.pop(context); //close the drawer
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => FavouritesScreen()),
            //   );
            // },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () => _navigateTo(context, CartScreen()),
            // onTap: () {
            //   Navigator.pop(context); //close the drawer
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => CartScreen()),
            //   );
            // },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            // onTap: () => _navigateTo(context, ProfileScreen()),
            onTap: () {
              Navigator.pop(context); //close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            // onTap: () => _navigateTo(context, SettingsScreen()),
            onTap: () {
              Navigator.pop(context); //close the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          SwitchListTile(
            secondary: Icon(Icons.brightness_6),
            title: Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (value) => themeProvider.toggleTheme(),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.pop(context); // Close drawer
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}

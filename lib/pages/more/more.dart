import 'package:ferrous/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MorePage extends ConsumerStatefulWidget {
  const MorePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MorePageState();
}

class _MorePageState extends ConsumerState<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
      ),

      ///
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            "Me",
            style: TextStyle(
              fontSize: 18,
              color: Colors.green,
            ),
          ),

          ///
          ListTile(
            contentPadding: EdgeInsets.all(0),
            // leading: Icon(Icons.person_outlined),
            title: Text('My Account'),
            subtitle: Text('Me'),
            onTap: () {
              // Navigate to settings page
            },
          ),

          ListTile(
            contentPadding: EdgeInsets.all(0),
            // leading: Icon(Icons.school_outlined),
            title: Text('Ferrous Learn'),
            subtitle: Text('Ferrous Learn'),
            onTap: () {
              // Navigate to about page
            },
          ),

          ListTile(
            contentPadding: EdgeInsets.all(0),
            // leading: Icon(Icons.school_outlined),
            title: Text('News'),
            subtitle: Text('Stay on top of things'),
            onTap: () {
              // Navigate to about page
            },
          ),

          ///
          SizedBox(
            height: 30,
          ),

          ///
          Text(
            "App",
            style: TextStyle(
              fontSize: 18,
              color: Colors.amber,
            ),
          ),

          ///
          MoreActionTile(
            title: Text("Theme"),
            subtitle: Text("Set app theme"),
            leading: Icon(Icons.color_lens_outlined),
            onTap: () {
              ref.read(themeModeProvider.notifier).changeTheme();
            },
            trailing: ref.watch(themeModeProvider) == ThemeMode.light
                ? Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.amber,
                  )
                : Icon(
                    Icons.mode_night_outlined,
                    color: Colors.blue[900],
                  ),
          ),

          ///
          ListTile(
            contentPadding: EdgeInsets.all(0),
            // leading: Icon(
            //   Icons.mode_standby_sharp,
            // ),
            title: Text('Currency'),
            subtitle: Text("Set your preferred currency"),
            onTap: () {
              // Navigate to about page
            },
          ),

          ///
          ListTile(
            contentPadding: EdgeInsets.all(0),
            // leading: Icon(
            //   Icons.language_outlined,
            // ),
            title: Text('Language'),
            subtitle: Text('Set your preferred language'),
            onTap: () {
              // Navigate to about page
            },
          ),

          ///
          SizedBox(
            height: 30,
          ),

          ///
          Text(
            "General",
            style: TextStyle(
              fontSize: 18,
              color: Colors.indigo,
            ),
          ),

          ///

          MoreActionTile(
            title: Text('Help & Support'),
            onTap: () {
              // Navigate to help page
            },
          ),
          MoreActionTile(
            title: Text('Privacy Policy'),
            onTap: () {
              // Navigate to help page
            },
          ),
          MoreActionTile(
            title: Text('Terms & Conditions'),
            onTap: () {
              // Navigate to help page
            },
          ),

          MoreActionTile(
            title: Text('About Us'),
            onTap: () {
              // Navigate to about page
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.public,
                ),
                onPressed: () {
                  // Navigate to Telegram channel
                },
              ),
              IconButton(
                icon: Text(
                  String.fromCharCodes([0xD835, 0xDD4F]),
                  style: TextStyle(
                    fontSize: 24,
                    // color: Colors.grey,
                  ),
                ),
                onPressed: () {
                  // Navigate to Telegram channel
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MoreActionTile extends StatelessWidget {
  const MoreActionTile(
      {super.key,
      this.title,
      this.subtitle,
      this.leading,
      this.trailing,
      this.onTap});

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: title,
      subtitle: subtitle,
      onTap: onTap,
      trailing: trailing,
    );
  }
}

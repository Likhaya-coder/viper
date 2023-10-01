import 'package:flutter/material.dart';
import 'package:vapor/components/chats.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF6A1313),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ViperChat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'GreatVibes',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20.0),
                      Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              labelColor: const Color(0xFFF76F6F),
              unselectedLabelColor: Colors.grey[400],
              indicatorColor: const Color(0xFFF76F6F),
              indicatorWeight: 3,
              tabs: const [
                //Tab(icon: Icon(Icons.account_circle), text: 'User'),
                Tab(icon: Icon(Icons.chat), text: 'Chats'),
                Tab(icon: Icon(Icons.update), text: 'Updates'),
                Tab(icon: Icon(Icons.call), text: 'Calls'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              //Center(child: Text('Chats')),
              Chats(),
              Center(child: Text('Updates')),
              Center(child: Text('Calls')),
            ],
          ),
        ),
      ),
    );
  }
}

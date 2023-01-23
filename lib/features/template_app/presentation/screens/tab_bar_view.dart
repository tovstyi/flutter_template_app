import 'package:flutter/material.dart';

class SliverScrollPage extends StatefulWidget {
  const SliverScrollPage({Key? key}) : super(key: key);

  @override
  State<SliverScrollPage> createState() => _SliverScrollPageState();
}

class _SliverScrollPageState extends State<SliverScrollPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car), // Screen for 1st page
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ));
  }
}

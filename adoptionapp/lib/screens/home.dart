import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Rustum Jordan'),
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75, //20.0,
        // padding: EdgeInsets.zero,
        child: const Drawer(
          child: side(),
        ),
      ),
      body: ListView(
        children: const [
          Text('You are now in Home', style: TextStyle(fontSize: 30))
        ],
      ),
    );
  }
}

class side extends StatelessWidget {
  const side({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Welcome Rustum'),
        ),
        ListTile(
          title: Text('Item 1'),
        ),
        ListTile(
          title: Text('Item 2'),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageUI extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePageUI>
    with SingleTickerProviderStateMixin {
  final colors = <Color>[Colors.indigo, Colors.blue, Colors.orange, Colors.red];

  double _size = 250.0;

  bool _large = true;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 0.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AnimatedSize(
              curve: Curves.easeIn,
              //  key: this,
              duration: Duration(milliseconds:  200),
              child: LeftDrawer(size: _size)

          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.black87),
                        onPressed: () {
                          _updateSize();
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Dashboard',
                          style: const TextStyle(color: Colors.black87),
                        ),
                        onPressed: () {},
                      ),

                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.notification_important,
                            color: Colors.black87),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        icon: Icon(Icons.power_settings_new, color: Colors.black87),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),

                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
                Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          'Home >',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          _container(0,"Total users","100"),
                          _container(1,"Total Keys","150"),
                          _container(2,"Total Plans/purchase details","3"),
                        ],
                      ),
                      Container(
                        height: 400,
                        color: Color(0xFFE7E7E7),
                        padding: const EdgeInsets.all(16),
                        child: Card(
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Other details of the month',
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _container(int index,String heading,String count) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xFFE7E7E7),
        child: Card(
          color: Color(0xFFE7E7E7),
          child: Container(
            color: colors[index],
            width: 250,
            height: 140,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                          count,
                          style: TextStyle(fontSize: 24),
                        )),
                    Icon(Icons.more_vert),
                  ],
                ),
                Text(heading)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeftDrawer extends StatelessWidget {
  LeftDrawer({
    required this.size,
  }) ;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: size,
        color: const Color(0xFF01678F),
        child: ListView(
          children: [

            Container(width: 80,
                color: Color(0xc503cccc),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                height: 80,child:  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child:Image.asset("assets/images.jpg", fit: BoxFit.cover)
                )
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              color: Color(0xc503cccc),
              child: Text('Saloni shrivastava',style: TextStyle(fontSize: 22)),
            ),
            _tile('Dashboard'),
            _tile('Home'),
            _tile('Users'),
            _tile('Keys'),
            _tile('Plans'),
            _tile('Profile'),
            _tile('Logout'),
          ],
        ),
      ),
    );
  }

  Widget _tile(String label) {
    return ListTile(
      title: Text(label),
      onTap: () {},
    );
  }
}
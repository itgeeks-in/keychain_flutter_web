import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final colors = <Color>[Colors.indigo, Colors.blue, Colors.orange, Colors.red];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  // Card(
                  //   margin: EdgeInsets.zero,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(0),
                  //   ),
                  //   child: Container(
                  //     color: Colors.white,
                  //     padding: const EdgeInsets.all(20),
                  //     child: const Row(
                  //       children: [
                  //         Text(
                  //           'Home >',
                  //           style: TextStyle(color: Colors.black),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    child: Row(
                      children: [
                        _container(0, "Total users", "1000"),
                        _container(1, "Total Keys", "150"),
                        _container(2, "Total Plans/purchase details", "3"),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    // color: const Color(0xFFE7E7E7),
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'Other details of the month',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _container(int index, String heading, String count) {
    return Expanded(
      child: Container(
        color: colors[index],
        margin: EdgeInsets.all(20),
        // width: 250,
        height: 180,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    count,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
            Text(heading),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:key_admin_panel/views/users/PopUpScreen/PopUpAddUser.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var data;
  Future<void> getUserData() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          height: 40,
          // color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(width: 80, child: const Text('User')),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        )), // Centering the Icon
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 8, 185, 216),
                      shape: const CircleBorder(),
                      elevation: 5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                width: double.infinity,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        height: 40,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 8, 185, 216),
                                    width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 8, 185, 216)),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                    color: Colors.black45, width: 2),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_search_sharp,
                                color: Color.fromARGB(255, 8, 185, 216),
                              ),
                              hintText: "Search"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => PopUpAddUser(),
                          );
                        },
                        child: const Text(
                          'Add User +',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Color.fromARGB(255, 8, 185, 216),
                          elevation: 10,
                          backgroundColor: Color.fromARGB(255, 8, 185, 216),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 2,
                          color: Color.fromARGB(255, 8, 185, 216),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(193, 223, 212, 212),
                            blurRadius: 8,
                            spreadRadius: 4,
                            // offset: Offset(0, 10),
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.amber,
                            child: const Text(
                              "Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.blue,
                            child: const Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.amber,
                            child: const Text(
                              "Mobile Number",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // color: Colors.blue,
                            child: const Text(
                              "Keys",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // color: Colors.amber,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 60),
                              child: Text(
                                "Action",
                                style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: getUserData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                                backgroundColor: Colors.grey,
                                value: 0.50,
                              ));
                        } else {
                          return Container(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                          width: 2,
                                          color: Color.fromARGB(255, 8, 185, 216),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color:
                                            Color.fromARGB(193, 223, 212, 212),
                                            blurRadius: 8,
                                            spreadRadius: 4,
                                            // offset: Offset(0, 10),
                                          )
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            // color: Colors.amber,
                                            child: Text(
                                              data[index]['name'].toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            // color: Colors.blue,
                                            child: Text(
                                              data[index]['email'].toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            // color: Colors.amber,
                                            child: const Text(
                                              "9638520741",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: const Text(
                                              "12",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // color: Colors.amber,
                                            child: Center(
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 80,
                                                    child: OutlinedButton(
                                                      onPressed: () {
                                                        // showBottomSheet(context: context, builder: builder)
                                                      },
                                                      child: Text(
                                                        'View',
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                      style:
                                                      OutlinedButton.styleFrom(
                                                        side: const BorderSide(
                                                          // width: 5.0,
                                                            color: Colors.white),
                                                        backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 8, 185, 216),
                                                        shape:
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        bottom: 10),
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons.edit,
                                                        size: 23,
                                                        color: Color.fromARGB(
                                                            255, 8, 185, 216),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }),
                )
              ],
            )),
      ),
    );
  }
}



// Padding(
//                                             padding: const EdgeInsets.only(
//                                                 right: 10),
//                                             child: InkWell(
//                                               onTap: () {},
//                                               child: Container(
//                                                 width: 20,
//                                                 // height: 0,
//                                                 child: Center(
//                                                     child: Text(
//                                                   "View",
//                                                   style: TextStyle(
//                                                     color: Color.fromARGB(
//                                                         255, 8, 185, 216),
//                                                   ),
//                                                 )),
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 10)),
//                                                     border: Border.all(
//                                                       width: 2,
//                                                       color: Color.fromARGB(
//                                                           255, 8, 185, 216),
//                                                     ),
//                                                     boxShadow: [
//                                                       BoxShadow(
//                                                         color: Color.fromARGB(
//                                                             193,
//                                                             223,
//                                                             212,
//                                                             212),
//                                                         blurRadius: 8,
//                                                         spreadRadius: 4,
//                                                         // offset: Offset(0, 10),
//                                                       )
//                                                     ]),
//                                               ),
//                                             ),
//                                           ),

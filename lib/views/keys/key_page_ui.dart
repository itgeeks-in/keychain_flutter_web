import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KeyPageUI extends StatefulWidget {
  const KeyPageUI({super.key});

  @override
  State<KeyPageUI> createState() => _KeyPageUIState();
}

class _KeyPageUIState extends State<KeyPageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          height: 40,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 80,
                    child: const Text(
                      'Key',
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 185, 216),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {}, // Change made here
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 8, 185, 216),
                      shape: CircleBorder(),
                      elevation: 5,
                    ),
                  )
                ],
              ),
              SizedBox(
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.only(bottom: 15, top: 0),
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 8, 185, 216), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 8, 185, 216)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide:
                        const BorderSide(color: Colors.black45, width: 2),
                  ),
                  prefixIcon: const Icon(
                    Icons.person_search_sharp,
                    color: Color.fromARGB(255, 8, 185, 216),
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
            KeyHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    // height: 100,
                    height: 150,
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: const EdgeInsets.all(15),
                    // height: 50,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              // color: Colors.black,
                              child: Row(
                                children: [
                                  Container(
                                    height: 150,
                                    child: Image.asset("assets/keys.jpg",
                                        fit: BoxFit.cover),
                                    //           ),
                                    // child:
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          // height: 50,
                                          // color: Colors.red,
                                          )),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.blue,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Document's scope. ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.amber,
                            padding: EdgeInsets.only(right: 35),
                            child: const Text(
                              "A document description is a USPTO-defined description of forms and documents that are received and processed in the USPTO.",
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
                            // color: Colors.blue,
                            child: const Text(
                              "A document description is a USPTO-defined description of forms and documents that are received and processed in the USPTO.",
                              style: TextStyle(
                                color: Colors.grey,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // showBottomSheet(context: context, builder: builder)
                                      },
                                      child: Text(
                                        'View',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            // width: 5.0,
                                            color: Colors.white),
                                        backgroundColor:
                                            Color.fromARGB(255, 8, 185, 216),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.edit,
                                        size: 23,
                                        color: Color.fromARGB(255, 8, 185, 216),
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class KeyHeader extends StatelessWidget {
  const KeyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      // margin: EdgeInsets.only(bottom: 20),
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
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.amber,
              padding: EdgeInsets.only(left: 10),
              child: const Text(
                "Image",
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
              padding: EdgeInsets.only(left: 10),
              // color: Colors.blue,
              child: const Text(
                "KeyName",
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
              child: const Text(
                "Capture",
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
                "Description",
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
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Person {
  final String name;
  final String email;

  final String startDate;
  final String expiryDate;
  final String purchasePlan;

  Person({
    required this.name,
    required this.email,
    required this.startDate,
    required this.expiryDate,
    required this.purchasePlan,
  });
}

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    final List<Person> users = [
      Person(
        name: "Ram",
        email: "ram@example.com",
        startDate: "2024-01-01",
        expiryDate: "2024-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Ramnujan",
        email: "ramnujan@example.com",
        startDate: "2024-02-15",
        expiryDate: "2024-12-31",
        purchasePlan: "Premium",
      ),
      Person(
        name: "Vijay",
        email: "vijay@example.com",
        startDate: "2024-03-10",
        expiryDate: "2024-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Ram",
        email: "ram@example.com",
        startDate: "2024-01-01",
        expiryDate: "2024-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Ramnujan",
        email: "ramnujan@example.com",
        startDate: "2024-02-15",
        expiryDate: "2024-12-31",
        purchasePlan: "Premium",
      ),
      Person(
        name: "Vijay",
        email: "vijay@example.com",
        startDate: "2024-03-10",
        expiryDate: "2024-12-31",
        purchasePlan: "Basic",
      ),
      // Add more Person objects here
      Person(
        name: "Ajay",
        email: "ajay@example.com",
        startDate: "2024-04-20",
        expiryDate: "2024-12-31",
        purchasePlan: "Premium",
      ),
      Person(
        name: "Shyam",
        email: "shyam@example.com",
        startDate: "2024-05-05",
        expiryDate: "2024-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Raj",
        email: "raj@example.com",
        startDate: "2024-06-15",
        expiryDate: "2024-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Sita",
        email: "sita@example.com",
        startDate: "2024-07-10",
        expiryDate: "2024-12-31",
        purchasePlan: "Premium",
      ),
      Person(
        name: "Gita",
        email: "gita@example.com",
        startDate: "2024-08-25",
        expiryDate: "2024-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Mohan",
        email: "mohan@example.com",
        startDate: "2024-09-05",
        expiryDate: "2024-12-31",
        purchasePlan: "Premium",
      ),
      Person(
        name: "Radha",
        email: "radha@example.com",
        startDate: "2024-10-15",
        expiryDate: "2024-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Krishna",
        email: "krishna@example.com",
        startDate: "2024-11-20",
        expiryDate: "2024-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Lakshman",
        email: "lakshman@example.com",
        startDate: "2024-12-10",
        expiryDate: "2024-12-31",
        purchasePlan: "Premium",
      ),
      Person(
        name: "Hanuman",
        email: "hanuman@example.com",
        startDate: "2025-01-05",
        expiryDate: "2025-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Saraswati",
        email: "saraswati@example.com",
        startDate: "2025-02-15",
        expiryDate: "2025-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Ganesha",
        email: "ganesha@example.com",
        startDate: "2025-03-20",
        expiryDate: "2025-12-31",
        purchasePlan: "Premium",
      ),
      Person(
        name: "Parvati",
        email: "parvati@example.com",
        startDate: "2025-04-10",
        expiryDate: "2025-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Rama",
        email: "rama@example.com",
        startDate: "2025-05-05",
        expiryDate: "2025-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Sita",
        email: "sita@example.com",
        startDate: "2025-06-15",
        expiryDate: "2025-12-31",
        purchasePlan: "Premium",
      ),
      Person(
        name: "Lakshman",
        email: "lakshman@example.com",
        startDate: "2025-07-10",
        expiryDate: "2025-12-31",
        purchasePlan: "Basic",
      ),
      Person(
        name: "Hanuman",
        email: "hanuman@example.com",
        startDate: "2025-08-25",
        expiryDate: "2025-12-31",
        purchasePlan: "Premium",
      ),
      // Add more persons here
    ];

    return Scaffold(
        backgroundColor: const Color(0xFFE7E7E7),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // _container("heagfdsgdsgding", "\$1940"),
                  _container("Basic", "\$1940"),
                  _container("Advanced", "\$3570"),
                  _container("Premium", "\$6630"),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Plans +',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Color.fromARGB(255, 8, 185, 216),
                        elevation: 10,
                        backgroundColor: Color.fromARGB(255, 8, 185, 216),
                      ),
                    ),
                  )
                ],
              ),
              SubscriptionHeading(),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height * 0.6,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 2, color: Colors.black)),
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final data = users[index];
                    return Container(
                      margin: const EdgeInsets.all(10.0),
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            width: 1,
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
                        // crossAxisAlignment: CrossAxisAlignment.,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              // color: Colors.amber,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                data.name,
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
                            child: Text(
                              data.email,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              data.startDate,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              data.expiryDate,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(
                                data.purchasePlan,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

Widget _container(String heading, String count) {
  return Container(
    margin: const EdgeInsets.only(
      top: 10,
    ),
    alignment: Alignment.centerLeft,
    // height: 470,
    width: 250,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(21)),
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
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
              child: Text(heading,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ))),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              count,
              style: TextStyle(
                  color: Color.fromARGB(255, 8, 185, 216), fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Color.fromARGB(255, 8, 185, 216),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Color.fromARGB(255, 8, 185, 216),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class SubscriptionHeading extends StatelessWidget {
  const SubscriptionHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
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
              child: const Text(
                "UserName",
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
                "Start Date ",
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
                "Expiry Date",
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
              child: const Padding(
                padding: EdgeInsets.only(left: 60),
                child: Text(
                  "View Purchase",
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
    );
  }
}

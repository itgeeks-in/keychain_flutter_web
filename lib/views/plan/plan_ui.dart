import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/color_const.dart';

class Plan {
  String name;
  String price;

  Plan({required this.name, required this.price});
}

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
  const PlanPage({Key? key}) : super(key: key);

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  List<Plan> plans = [
    Plan(name: "Basic", price: "\$0"),
    Plan(name: "Advanced", price: "\$3.9"),
    Plan(name: "Premium", price: "\$10.9"),
  ];
  final List<Person> users = [
    // Add more persons here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _container(plans[0].name, plans[0].price,
                    () => _showEditDialog(plans[0])),
                _container(plans[1].name, plans[1].price,
                    () => _showEditDialog(plans[1])),
                _container(plans[2].name, plans[2].price,
                    () => _showEditDialog(plans[2])),
              ],
            ),
            SubscriptionHeading(),
            SizedBox(height: 50,),
            Center(child: Text('We are still working on Plan page functionality ,sorry for inconvenience !',style: TextStyle(color: ColorConsts.redColor,fontSize: 20),),),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final data = users[index];
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 45,
                    decoration: BoxDecoration(
                        color: ColorConsts.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1, color: ColorConsts.primaryColor),
                        boxShadow: const [
                          BoxShadow(
                            color: ColorConsts.boxShadowColor,
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
                                color: ColorConsts.textColorDark,
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
                              color: ColorConsts.textColorDark,
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
                              color: ColorConsts.textColorDark,
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
                              color: ColorConsts.textColorDark,
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
                                color: ColorConsts.textColorDark,
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
      ),
    );
  }

  Widget _container(String name, String price, VoidCallback? callback) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      alignment: Alignment.centerLeft,
      width: 250,
      decoration: BoxDecoration(
        color: ColorConsts.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(21)),
        border: Border.all(
          width: 2,
          color: ColorConsts.primaryColor,
        ),
        boxShadow: const [
          BoxShadow(
            color: ColorConsts.boxShadowColor,
            blurRadius: 8,
            spreadRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    callback!();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.edit_outlined,
                      color: ColorConsts.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            Center(
                child: Text(name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                price,
                style: TextStyle(color: ColorConsts.primaryColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(Plan plan) {
    TextEditingController nameController =
        TextEditingController(text: plan.name);
    TextEditingController priceController =
        TextEditingController(text: plan.price);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorConsts.backgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit plan',
                style: TextStyle(
                  color: ColorConsts.primaryColor,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.close_outlined,
                  color: ColorConsts.primaryColor,
                ),
              )
            ],
          ),
          content: Container(
            width: 350,
            height: 250,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: CustomTextField(
                      controller: nameController,
                      isPassVisible: false,
                      labelText: "Title",
                      prefixIconData: Icons.subscriptions,
                      hintText: "Enter title",
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: 20, bottom: 5),
                    child: CustomTextField(
                      controller: priceController,
                      isPassVisible: false,
                      labelText: "Plan price",
                      prefixIconData: Icons.price_change_outlined,
                      hintText: "Enter price",
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 100,
                  child: RoundedButton(
                    btnName: "Save",
                    callback: () {
                      setState(() {
                        plan.name = nameController.text;
                        plan.price = priceController.text;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
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
          color: ColorConsts.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            width: 2,
            color: ColorConsts.primaryColor,
          ),
          boxShadow: const [
            BoxShadow(
              color: ColorConsts.boxShadowColor,
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
                "User Name",
                style: TextStyle(
                    color: ColorConsts.textColorLight,
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
                    color: ColorConsts.textColorLight,
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
                "Start date ",
                style: TextStyle(
                    color: ColorConsts.textColorLight,
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
                "Expiry date",
                style: TextStyle(
                    color: ColorConsts.textColorLight,
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
                  "Plan",
                  style: TextStyle(
                      color: ColorConsts.textColorLight,
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/plan/bloc/plan_state.dart';

import '../../widgets/loader_widget.dart';
import 'bloc/plan_bloc.dart';

class Plan {
  String name;
  String price;

  Plan({required this.name, required this.price});
}

class PlanPageUI extends StatefulWidget {
  const PlanPageUI({Key? key}) : super(key: key);

  @override
  State<PlanPageUI> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPageUI> {
  List<Plan> plans = [
    Plan(name: "Basic", price: "\$0"),
    Plan(name: "Advanced", price: "\$3.9"),
    Plan(name: "Premium", price: "\$10.9"),
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
            Container(
              margin: EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height * 0.6,
              child:
                  BlocBuilder<PlanBloc, PlanState>(builder: (context, state) {
                if (state is SuccessState) {
                  return ListView.builder(
                    itemCount: state.userDataPlan.length,
                    itemBuilder: (context, index) {
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
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  state.userDataPlan[index].firstName.isNotEmpty
                                      ? state.userDataPlan[index].firstName +
                                          " " +
                                          state.userDataPlan[index].lastName
                                      : 'NA',
                                  style: ThemeText.textMediumSecondary,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                state.userDataPlan[index].email.isNotEmpty
                                    ? state.userDataPlan[index].email
                                    : 'NA',
                                style: ThemeText.textMediumSecondary,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                state.userDataPlan[index].plan.createdAt
                                        .isNotEmpty
                                    ? state.userDataPlan[index].createdAt
                                        .split("T")[0]
                                    : 'NA',
                                style: ThemeText.textMediumSecondary,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  state.userDataPlan[index].plan.planName
                                          .isNotEmpty
                                      ? state.userDataPlan[index].plan.planName
                                      : 'NA',
                                  style: ThemeText.textMediumSecondary,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is DataNotFoundState) {
                  return Center(
                    child: Text(
                      state.msg,
                      style: ThemeText.textMediumSecondaryBold,
                    ),
                  );
                } else {
                  return Center(child: Loader().loaderWidget2());
                }
              }),
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
                style: ThemeText.textMediumPrimaryBold,
                maxLines: 1,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: const Text("Email",
                  style: ThemeText.textMediumPrimaryBold, maxLines: 1),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: const Text("Start date",
                  style: ThemeText.textMediumPrimaryBold, maxLines: 1),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: const Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text("Plan",
                      style: ThemeText.textMediumPrimaryBold, maxLines: 1)),
            ),
          )
        ],
      ),
    );
  }
}

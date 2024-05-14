import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';
import 'package:key_admin_panel/utils/RoundedButton.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/plan/bloc/plan_state.dart';
import 'package:key_admin_panel/views/plan/bloc_for_plan_list/plan_list_bloc.dart';
import 'package:key_admin_panel/views/plan/bloc_for_plan_list/plan_list_state.dart';

import '../../model/plan_model.dart';
import '../../widgets/loader_widget.dart';
import 'bloc/plan_bloc.dart';

class PlanPageUI extends StatefulWidget {
  const PlanPageUI({Key? key}) : super(key: key);

  @override
  State<PlanPageUI> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocProvider(
              create: (context) => PlanListBloc(),
              child: BlocBuilder<PlanListBloc, PlanListState>(
                builder: (context, state) {
                  if (state is PlanSuccessState) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8.0),
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.planDetail.length,
                        itemBuilder: (context, index) {
                          final plan = state.planDetail[index];
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(8.0),
                              width: 275,
                              decoration: BoxDecoration(
                                color: ColorConsts.backgroundColor,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 1,
                                    color: ColorConsts.secondaryColor),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(plan.planName +"\n\$"+plan.price +"\n"+(plan.keyCount.toString().contains("unlimited")?"Unlimited keys":"You can scan upto " +
                                      plan.keyCount.toString()+
                                      " Keys"), style: ThemeText.textMediumSecondaryBold,textAlign: TextAlign.start,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkResponse(
                                        onTap: () => _showEditDialog(plan),
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  ColorConsts.primaryColor,
                                                  ColorConsts.primaryColor,
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(25.0)
                                              ,boxShadow: const [BoxShadow(
                                            color: ColorConsts.primaryColor,
                                            blurRadius: 1.0,
                                            offset: Offset(1, 2),
                                          ),]
                                          ),
                                          padding:
                                          const EdgeInsets.all(1.0),
                                          child: const Icon(
                                            Icons.edit_outlined,
                                            color: ColorConsts.whiteColor,size: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      InkResponse(
                                        onTap: () {
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  ColorConsts.primaryColor,
                                                  ColorConsts.primaryColor,
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(25.0)

                                              ,boxShadow: const [BoxShadow(
                                            color: ColorConsts.primaryColor,
                                            blurRadius: 1.0,
                                            offset: Offset(1, 2),
                                          ),]
                                          ),
                                          padding:
                                          const EdgeInsets.all(1.0),
                                          child: const Icon(
                                            Icons.delete_forever,
                                            color: ColorConsts.whiteColor,size: 20,
                                          ),
                                        ),

                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is PlanNotFoundState) {
                    return Center(child: Text('Plans not found.'));
                  } else {
                    return Center(child: Loader().loaderWidget2());
                  }
                },
              ),
            ),
            Center(
              child: Text(
                'History',
                style: ThemeText.textLargeSecondaryBold,
              ),
            ),
            SubscriptionHeading(),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child:
                  BlocBuilder<PlanBloc, PlanState>(builder: (context, state) {
                if (state is SuccessState) {
                  return ListView.builder(
                    itemCount: state.userDataPlan.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 45,
                        decoration: BoxDecoration(
                          color: ColorConsts.whiteColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              width: 1, color: ColorConsts.primaryColor),
                        ),
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
                                  style:state.userDataPlan[index].firstName.isNotEmpty ? ThemeText.textMediumSecondary : ThemeText.textMediumGrey,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                state.userDataPlan[index].email.isNotEmpty
                                    ? state.userDataPlan[index].email
                                    : 'NA',
                                style:state.userDataPlan[index].email.isNotEmpty ? ThemeText.textMediumSecondary : ThemeText.textMediumGrey,
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
                                style:state.userDataPlan[index].plan.createdAt.isNotEmpty ? ThemeText.textMediumSecondary : ThemeText.textMediumGrey,
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
                                  style:state.userDataPlan[index].plan.planName.isNotEmpty ? ThemeText.textMediumSecondary : ThemeText.textMediumGrey,
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

  void _showEditDialog(PlanDetail plan) {
    TextEditingController nameController =
        TextEditingController(text: plan.planName);
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
                        plan.planName = nameController.text;
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
      ),
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

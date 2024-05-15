import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_admin_panel/utils/color_const.dart';
import 'package:key_admin_panel/utils/theme_text.dart';
import 'package:key_admin_panel/views/plan/bloc/plan_state.dart';
import 'package:key_admin_panel/views/plan/bloc_for_plan_list/plan_list_bloc.dart';
import 'package:key_admin_panel/views/plan/bloc_for_plan_list/plan_list_state.dart';
import 'package:key_admin_panel/views/plan/plan_page_presenter.dart';

import '../../model/plan_model.dart';
import '../../utils/ShowSnackBar.dart';
import '../../utils/loading_dialog.dart';
import '../../widgets/buttons.dart';
import '../../widgets/loader_widget.dart';
import 'bloc/plan_bloc.dart';

class PlanPageUI extends StatefulWidget {
  const PlanPageUI({Key? key}) : super(key: key);

  @override
  State<PlanPageUI> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPageUI> {


  editAPICall(id, planName, price) async {
    LoadingDialog.show(context);
    var result = await PlanPagePresenter().editPlan(id, planName, price);
    LoadingDialog.hide(context);
    if (result.toString().contains("status")) {
      Map<String, dynamic> parsed = json.decode(result.toString());
      ShowSnackBar().snackBarSuccessShow(context, parsed["message"]);
      Navigator.pop(context);
      context.read<PlanListBloc>()
       .filtered();
    } else {
      Navigator.pop(context);
      ShowSnackBar().snackBarSuccessShow(context, "Try Again later!");
    }
  }

  deleteAPICall(String id) async {
    LoadingDialog.show(context);
    var result=await PlanPagePresenter().deletePlan(id);
    print("Working");
    LoadingDialog.hide(context);
    if(result.toString().contains("status")){
      Map<String, dynamic> parsed = json.decode(result.toString());
      ShowSnackBar().snackBarSuccessShow(context, parsed["message"]);

      Navigator.pop(context);
      context
          .read<PlanListBloc>()
          .filtered();
    }else{
      Navigator.pop(context);
      ShowSnackBar().snackBarSuccessShow(context, "Try Again !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.backgroundColor,
      body: Expanded(
        //margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<PlanListBloc, PlanListState>(
              builder: (context, state) {
                if (state is PlanSuccessState) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.planDetail.length,
                      itemBuilder: (context, index) {
                        final planDetail = state.planDetail[index];
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
                                  width: 1, color: ColorConsts.secondaryColor),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        planDetail.planName,
                                        style: ThemeText.textMediumPrimaryBold,
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        "\$" +
                                            planDetail.price +
                                            "\n" +
                                            (planDetail.keyCount
                                                    .toString()
                                                    .contains("unlimited")
                                                ? "Unlimited keys"
                                                : "You can scan upto " +
                                                    planDetail.keyCount
                                                        .toString() +
                                                    " Keys"),
                                        style: ThemeText.textMediumGrey,
                                        textAlign: TextAlign.start,
                                      ),
                                    ]),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkResponse(
                                      onTap: () =>
                                          _showEditDialog(context, planDetail,
                                              (name, id, price) {
                                        editAPICall(id, name, price);
                                      }),
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
                                                BorderRadius.circular(25.0),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: ColorConsts.primaryColor,
                                                blurRadius: 1.0,
                                                offset: Offset(1, 2),
                                              ),
                                            ]),
                                        padding: const EdgeInsets.all(1.0),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          color: ColorConsts.whiteColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkResponse(
                                      onTap: () =>
                                          _showDeleteDialog(context,
                                                  () {
                                                deleteAPICall(state.planDetail[index].id);
                                              }),
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
                                                BorderRadius.circular(25.0),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: ColorConsts.primaryColor,
                                                blurRadius: 1.0,
                                                offset: Offset(1, 2),
                                              ),
                                            ]),
                                        padding: const EdgeInsets.all(1.0),
                                        child: const Icon(
                                          Icons.delete_forever,
                                          color: ColorConsts.whiteColor,
                                          size: 20,
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
            Container(
             margin: EdgeInsets.only(left: 15.0),
              child: Text(
                'History',
                style: ThemeText.textLargeSecondaryBold,
              ),
            ),
            SubscriptionHeading(),
            Expanded(
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
                                  style: state.userDataPlan[index].firstName
                                          .isNotEmpty
                                      ? ThemeText.textMediumSecondary
                                      : ThemeText.textMediumGrey,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                state.userDataPlan[index].email.isNotEmpty
                                    ? state.userDataPlan[index].email
                                    : 'NA',
                                style:
                                    state.userDataPlan[index].email.isNotEmpty
                                        ? ThemeText.textMediumSecondary
                                        : ThemeText.textMediumGrey,
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
                                style: state.userDataPlan[index].plan.createdAt
                                        .isNotEmpty
                                    ? ThemeText.textMediumSecondary
                                    : ThemeText.textMediumGrey,
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
                                  style: state.userDataPlan[index].plan.planName
                                          .isNotEmpty
                                      ? ThemeText.textMediumSecondary
                                      : ThemeText.textMediumGrey,
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

  Future<bool> _showEditDialog(BuildContext context, PlanDetail planDetail,
      Function(String name, String id, String price) onClick) async {
    TextEditingController planNameController = TextEditingController();
    TextEditingController planPriceController = TextEditingController();
    bool isNameValid = false;
    bool isPriceValid = false;
    return (await showDialog(
            context: context,
            builder: (context) => StatefulBuilder(builder: (context, setState) {
                  planNameController.text = planDetail.planName;
                  planPriceController.text = planDetail.price;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: AlertDialog(
                      contentPadding: EdgeInsets.all(18.0),
                      elevation: 8,
                      backgroundColor: ColorConsts.backgroundColor,
                      content: SizedBox(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.height / 2,
                        child: Column(
                          children: [
                            Center(
                                child: Text("Edit Plan",
                                    style: ThemeText.textLargeSecondaryBold)),
                            SizedBox(height: 35),
                            SizedBox(
                              width: MediaQuery.of(context).size.height / 2,
                              child: TextField(
                                onChanged: (value) {
                                  if (planNameController.text.isNotEmpty) {
                                    isNameValid = true;
                                  } else {
                                    isNameValid = false;
                                  }
                                },
                                controller: planNameController,
                                style: ThemeText.textMediumSecondary,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorConsts.primaryColor,
                                          width: 2.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorConsts.primaryColor,
                                          width: 2.0),
                                    ),
                                    labelText: "Plan name",
                                    labelStyle: ThemeText.textMediumPrimary,
                                    alignLabelWithHint: true,
                                    hintText: "Enter plan name"),
                              ),
                            ),
                            if (isNameValid)
                              Text(
                                "Add plan name to continue..",
                                style: TextStyle(
                                    color: ColorConsts.redColor, fontSize: 14),
                              ),
                            SizedBox(height: 35),
                            SizedBox(
                              width: MediaQuery.of(context).size.height / 2,
                              child: TextField(
                                onChanged: (value) {
                                  if (planPriceController.text.isNotEmpty) {
                                    isPriceValid = true;
                                  } else {
                                    isPriceValid = false;
                                  }
                                },
                                controller: planPriceController,
                                style: ThemeText.textMediumSecondary,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorConsts.primaryColor,
                                          width: 2.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorConsts.primaryColor,
                                          width: 2.0),
                                    ),
                                    labelText: "Plan price",
                                    labelStyle: ThemeText.textMediumPrimary,
                                    alignLabelWithHint: true,
                                    hintText: "Enter plan price"),
                              ),
                            ),
                            if (isPriceValid)
                              Text(
                                "Add plan price to continue..",
                                style: TextStyle(
                                    color: ColorConsts.redColor, fontSize: 14),
                              ),
                          ],
                        ),
                      ),
                      actions: [
                        ButtonWidget().buttonWidgetSimple("Cancel",
                            () => Navigator.pop(context, false), 80.0, 40.0),
                        ButtonWidget().buttonWidgetSimple("Update", () async {
                          if (planNameController.text.isNotEmpty) {
                            isNameValid = false;
                            setState(
                              () {},
                            );
                          } else {
                            isNameValid = true;
                            setState(
                              () {},
                            );
                          }
                          if (planPriceController.text.isNotEmpty) {
                            isPriceValid = false;
                            setState(
                              () {},
                            );
                          } else {
                            isPriceValid = true;
                            setState(
                              () {},
                            );
                          }
                          if (planNameController.text.isNotEmpty &&
                              planPriceController.text.isNotEmpty) {
                            onClick(planNameController.text, planDetail.id,
                                planPriceController.text);
                          }
                        }, 80.0, 40.0),
                      ],
                    ),
                  );
                }))) ??
        false;
  }


  Future<bool> _showDeleteDialog(BuildContext context,Function() onClick) async {
    return( await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          contentPadding: EdgeInsets.all(30),
          elevation: 8,
          backgroundColor: ColorConsts.whiteColor,
          content: SizedBox(height: MediaQuery.of(context).size.height/4,child: Column(children: [Text(
            "\nAre you sure.. you want to delete this plan ? ",

            style:TextStyle(color: ColorConsts.secondaryColor,fontWeight: FontWeight.w500,fontSize: 22),
          ),Text(
            "\nWARNING: This action may affect associated user plans.",

            style:TextStyle(color: ColorConsts.redColor,fontSize: 15,fontWeight: FontWeight.w300),
          )])),
          actions: [
            ButtonWidget().buttonWidgetSimple("Cancel", () => Navigator.pop(context, false), 80.0, 40.0),
            ButtonWidget().buttonWidgetSimple("Continue", () async => {
              onClick.call(),
            }, 80.0, 40.0),
          ],
        )
    )) ?? false;
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

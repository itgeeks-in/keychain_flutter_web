import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:key_admin_panel/utils/CustomImagePicker.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  // Expanded(
                  //   flex: 2,
                  //   child: Container(
                  //     width: double.infinity,
                  //     height: 700,
                  //     // color: const Color(0xFFE7E7E7),
                  //     padding: const EdgeInsets.all(16),
                  //     child: Card(
                  //       color: Colors.white,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Column(
                  //           children: [
                  //             Container(
                  //               padding: const EdgeInsets.all(16),
                  //               child: const Text(
                  //                 'Plans',
                  //                 style: TextStyle(color: Colors.black87),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      // width: double.infinity,
                      height: 700,

                      // color: const Color(0xFFE7E7E7),
                      margin: const EdgeInsets.only(left: 150, right: 150),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    child: const Text(
                                      'Profile Details',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 25),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                EditUserProfile(),
                                          );
                                        },
                                        child: Text(
                                          "Edit",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 18),
                                        ),
                                      ))
                                ],
                              ),
                              Center(
                                child: CircleAvatar(
                                    radius: 64,
                                    backgroundImage: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrcxU00aT_8732RpJ6wVOf9zsgT4kA2UBlxg&s')),
                              ),
                              ReuseableRow(
                                  icon: Icons.person, text: "Patrici Lebsack"),
                              Container(
                                height: 2,
                                color: Colors.black12,
                              ),
                              ReuseableRow(
                                  icon: Icons.email,
                                  text: "example123@gmail.com"),
                              Container(
                                height: 2,
                                color: Colors.black12,
                              ),
                              ReuseableRow(
                                  icon: Icons.phone, text: "9638520741"),
                              Container(
                                height: 2,
                                color: Colors.black12,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: const Text(
                                  'plan',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Text(
                                  softWrap: true,
                                  "It seems like you're asking about a  seems like you're asking about a 'key plan description,' but could you please provide more context or specify what exactly you're looking for? Are you referring to a strategic plan 'key plan description,' but could you please provide more context or specify what exactly you're looking for? Are you referring to a strategic plan for a project, a description of a plan for a particular activity, or something else? The more details you provide, the better I can assist you!",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ReuseableRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: margin,
      margin: const EdgeInsets.only(top: 22, bottom: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 8, 185, 216),
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class EditUserProfile extends StatefulWidget {
  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  bool isPassVisible = false;
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 500,
      height: 600,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(21))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_outlined,
                    // size: 30,
                    color: Color.fromARGB(255, 8, 185, 216),
                  ),
                )
              ],
            ),
          ),

          Center(
            child: Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrcxU00aT_8732RpJ6wVOf9zsgT4kA2UBlxg&s')),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        color: Color.fromARGB(255, 8, 185, 216),
                      ),
                      onPressed: selectImage,
                    ))
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              isPassVisible: false,
              labelText: "Enter your Name",
              prefixIconData: Icons.person_add_outlined,
              hintText: "Enter your Name",
            )),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              isPassVisible: false,
              labelText: "Enter your Email",
              prefixIconData: Icons.email_outlined,
              hintText: "Enter your Email",
            )),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              isPassVisible: false,
              labelText: "Enter your Mob.",
              prefixIconData: Icons.phone_forwarded_sharp,
              hintText: "Enter your Mob.",
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Center(
                child: CustomTextField(
              labelText: 'Password',
              prefixIconData: Icons.lock,
              hintText: 'Enter your password',
              obscureText: true,
              suffixIconData: Icons.visibility,
              suffixIconDataSecond: Icons.visibility_off,
              isPassVisible: isPassVisible,
              onSuffixPressed: () {
                setState(() {
                  isPassVisible = !isPassVisible;
                });
              },
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shadowColor: Color.fromARGB(255, 8, 185, 216),
                  elevation: 12,
                  backgroundColor: Color.fromARGB(255, 8, 185, 216),
                ),
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

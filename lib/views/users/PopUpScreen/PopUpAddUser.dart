import 'package:flutter/material.dart';
import 'package:key_admin_panel/utils/CustomTextField.dart';

class PopUpAddUser extends StatefulWidget {
  @override
  _PopUpAddUserState createState() => _PopUpAddUserState();
}

class _PopUpAddUserState extends State<PopUpAddUser> {
  bool isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        height: 550,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(21)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                      color: Color.fromARGB(255, 8, 185, 216),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Add User",
              style: TextStyle(
                color: Color.fromARGB(255, 8, 185, 216),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                child: CustomTextField(
                  isPassVisible: false,
                  labelText: "Enter your Name",
                  prefixIconData: Icons.person_add_outlined,
                  hintText: "Enter your Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                child: CustomTextField(
                  isPassVisible: false,
                  labelText: "Enter your Email",
                  prefixIconData: Icons.email_outlined,
                  hintText: "Enter your Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Center(
                child: CustomTextField(
                  isPassVisible: false,
                  labelText: "Enter your Mob.",
                  prefixIconData: Icons.phone_forwarded_sharp,
                  hintText: "Enter your Mob.",
                ),
              ),
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
                    'Add User',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:key_admin_panel/utils/CustomTextField.dart';

// class PopUpAddUser extends StatelessWidget {
//   const PopUpAddUser({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//         child: Container(
//       width: 500,
//       height: 500,
//       decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(21))),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(
//                     Icons.close_outlined,
//                     // size: 30,
//                     color: Color.fromARGB(255, 8, 185, 216),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           const Text(
//             "Add User",
//             style: TextStyle(
//                 color: Color.fromARGB(255, 8, 185, 216),
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 50, right: 50, top: 20),
//             child: Center(
//                 child: CustomTextField(
//               labelText: "Enter your Name",
//               prefixIconData: Icons.person_add_outlined,
//               hintText: "Enter your Name",
//             )),
//           ),
//           // SizedBox(
//           //   height: 20,
//           // ),
//           const Padding(
//             padding: EdgeInsets.only(left: 50, right: 50, top: 20),
//             child: Center(
//                 child: CustomTextField(
//               labelText: "Enter your Email",
//               prefixIconData: Icons.email_outlined,
//               hintText: "Enter your Email",
//             )),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 50, right: 50, top: 20),
//             child: Center(
//                 child: CustomTextField(
//               labelText: "Enter your Mob.",
//               prefixIconData: Icons.phone_forwarded_sharp,
//               hintText: "Enter your Mob.",
//             )),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
//             child: Center(
//                 child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                         shadowColor: const Color.fromARGB(255, 8, 185, 216),
//                         elevation: 12,
//                         backgroundColor: const Color.fromARGB(255, 8, 185, 216)
//                         //  (state
//                         //         is SignInValidState)
//                         //     ? Colors.green
//                         //     : Color.fromARGB(255, 8, 185, 216)
//                         ),
//                     child: const Text(
//                       'Add User',
//                       style: TextStyle(color: Colors.white),
//                     ))),
//           ),
//         ],
//       ),
//     ));
//   }
// }

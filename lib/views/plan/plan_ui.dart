import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  final colors = <Color>[
    const Color.fromARGB(190, 5, 224, 213),
    const Color.fromARGB(255, 22, 206, 160),
    const Color.fromARGB(255, 238, 97, 3),
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 12),
                    child: const Text(
                      "Subscription Plan",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Add Plans +',
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
            const Text("Your current plan:Team ( Monthly and year  billed )"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _container(
                  0,
                  "Basic",
                  "\$1940",
                ),
                _container(1, "Advanced", "\$3570"),
                _container(2, "Premium", "\$6630")
              ],
            ),
            Text(
              "subs",
              style: TextStyle(color: Colors.amber),
            )
          ],
        ),
      ),
    );
  }

  Widget _container(int index, String heading, String count) {
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
          color: colors[index],
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
        padding: EdgeInsets.only(top: 5.0, bottom: 10.0, left: 5.0, right: 5.0),
        child: Expanded(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Edit",
                    style: TextStyle(color: colors[index]),
                  ),
                ),
              ],
            ),
            ReusableRow(
              icon: Icons.monetization_on_outlined,
              iconColor: colors[index],
              text: heading,
              size: 45,
              textStyle: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            ReusableRow(
              icon: Icons.check_circle_outline,
              iconColor: colors[index],
              text:
                  'Different subscription tiers may offer varied processing limits or features.',
              size: 20,
              textStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            ReusableRow(
              icon: Icons.check_circle_outline,
              iconColor: colors[index],
              text:
                  'Providers often offer assurances regarding the accuracy of key detection results.',
              size: 20,
              textStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            ReusableRow(
              icon: Icons.check_circle_outline,
              iconColor: colors[index],
              text:
                  'Subscribers receive ongoing support and updates to improve performance.',
              size: 20,
              textStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                count,
                style: TextStyle(color: colors[index], fontSize: 25),
              ),
            ),
            ElevatedButton(
              child: Text(
                'View Purchase',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors[index],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final int size;
  final TextStyle? textStyle;

  const ReusableRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.size,
    required this.iconColor,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          // top: 12,
          bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: Icon(
                icon,
                color: iconColor,
                size: size.toDouble(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// class PlanPage extends StatefulWidget {
//   const PlanPage({Key? key}) : super(key: key);

//   @override
//   State<PlanPage> createState() => _PlanPageState();
// }

// class _PlanPageState extends State<PlanPage> {
//   final colors = <Color>[
//     const Color.fromARGB(190, 5, 224, 213),
//     const Color.fromARGB(255, 22, 206, 160),
//     const Color.fromARGB(255, 238, 97, 3),
//     Colors.red
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE7E7E7),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(""),
//                   Center(
//                     child: Container(
//                       padding: const EdgeInsets.only(top: 12),
//                       child: const Text(
//                         "Subscription Plan",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Add Use +',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       shadowColor: Color.fromARGB(255, 8, 185, 216),
//                       elevation: 10,
//                       backgroundColor: Color.fromARGB(255, 8, 185, 216),
//                     ),
//                   )
//                 ],
//               ),
//               const Text("Your current plan:Team ( Monthly and year  billed )"),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(
//                   3,
//                   (index) => _container(
//                       index, "Plan ${index + 1}", "\$${(index + 1) * 1000}"),
//                 ).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _container(int index, String heading, String count) {
//     return Container(
//       margin: const EdgeInsets.only(
//         top: 10,
//       ),
//       alignment: Alignment.centerLeft,
//       // height: 470,
//       width: 250,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(21)),
//         border: Border.all(
//           width: 2,
//           color: colors[index],
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Color.fromARGB(193, 223, 212, 212),
//             blurRadius: 8,
//             spreadRadius: 4,
//           )
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(top: 5.0, bottom: 10.0, left: 5.0, right: 5.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ReusableRow(
//               icon: Icons.monetization_on_outlined,
//               iconColor: colors[index],
//               text: heading,
//               size: 45,
//               textStyle: TextStyle(
//                 fontSize: 26,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             ReusableRow(
//               icon: Icons.check_circle_outline,
//               iconColor: colors[index],
//               text:
//                   'Different subscription tiers may offer varied processing limits or features.',
//               size: 20,
//               textStyle: TextStyle(
//                 fontSize: 15,
//                 color: Colors.black,
//               ),
//             ),
//             ReusableRow(
//               icon: Icons.check_circle_outline,
//               iconColor: colors[index],
//               text:
//                   'Providers often offer assurances regarding the accuracy of key detection results.',
//               size: 20,
//               textStyle: TextStyle(
//                 fontSize: 15,
//                 color: Colors.black,
//               ),
//             ),
//             ReusableRow(
//               icon: Icons.check_circle_outline,
//               iconColor: colors[index],
//               text:
//                   'Subscribers receive ongoing support and updates to improve performance.',
//               size: 20,
//               textStyle: TextStyle(
//                 fontSize: 15,
//                 color: Colors.black,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 count,
//                 style: TextStyle(color: colors[index], fontSize: 25),
//               ),
//             ),
//             ElevatedButton(
//               child: Text(
//                 'View Purchase',
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: colors[index],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ReusableRow extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final Color iconColor;
//   final int size;
//   final TextStyle? textStyle;

//   const ReusableRow({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.size,
//     required this.iconColor,
//     required this.textStyle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//         top: 12,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Container(
//               margin: const EdgeInsets.only(right: 12),
//               child: Icon(
//                 icon,
//                 color: iconColor,
//                 size: size.toDouble(),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Text(
//               text,
//               style: textStyle,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class PlanPage extends StatefulWidget {
//   const PlanPage({Key? key}) : super(key: key);

//   @override
//   State<PlanPage> createState() => _PlanPageState();
// }

// class _PlanPageState extends State<PlanPage> {
//   final List<Map<String, String>> plans = [
//     {"name": "Basic", "price": "\$1000"},
//     {"name": "Advanced", "price": "\$2000"},
//     {"name": "Premium", "price": "\$3000"},
//   ];

//   final colors = <Color>[
//     const Color.fromARGB(190, 5, 224, 213),
//     const Color.fromARGB(255, 22, 206, 160),
//     const Color.fromARGB(255, 238, 97, 3),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE7E7E7),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(""),
//                   Center(
//                     child: Container(
//                       padding: const EdgeInsets.only(top: 12),
//                       child: const Text(
//                         "Subscription Plan",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Add Use +',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       shadowColor: Color.fromARGB(255, 8, 185, 216),
//                       elevation: 10,
//                       backgroundColor: Color.fromARGB(255, 8, 185, 216),
//                     ),
//                   )
//                 ],
//               ),
//               const Text("Your current plan:Team ( Monthly and year  billed )"),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: plans.map((plan) {
//                   final index = plans.indexOf(plan);
//                   return _container(index, plan["name"]!, plan["price"]!);
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _container(int index, String heading, String count) {
//     return Container(
//       margin: const EdgeInsets.only(
//         top: 10,
//       ),
//       alignment: Alignment.centerLeft,
//       width: 250,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(21)),
//         border: Border.all(
//           width: 2,
//           color: colors[index],
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Color.fromARGB(193, 223, 212, 212),
//             blurRadius: 8,
//             spreadRadius: 4,
//           )
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(top: 5.0, bottom: 10.0, left: 5.0, right: 5.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ReusableRow(
//               icon: Icons.monetization_on_outlined,
//               iconColor: colors[index],
//               text: heading,
//               size: 45,
//               textStyle: TextStyle(
//                 fontSize: 26,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             ReusableRow(
//               icon: Icons.check_circle_outline,
//               iconColor: colors[index],
//               text: 'Feature 1',
//               size: 20,
//               textStyle: TextStyle(
//                 fontSize: 15,
//                 color: Colors.black,
//               ),
//             ),
//             ReusableRow(
//               icon: Icons.check_circle_outline,
//               iconColor: colors[index],
//               text: 'Feature 2',
//               size: 20,
//               textStyle: TextStyle(
//                 fontSize: 15,
//                 color: Colors.black,
//               ),
//             ),
//             ReusableRow(
//               icon: Icons.check_circle_outline,
//               iconColor: colors[index],
//               text: 'Feature 3',
//               size: 20,
//               textStyle: TextStyle(
//                 fontSize: 15,
//                 color: Colors.black,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 count,
//                 style: TextStyle(color: colors[index], fontSize: 25),
//               ),
//             ),
//             ElevatedButton(
//               child: Text(
//                 'View Purchase',
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: colors[index],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ReusableRow extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final Color iconColor;
//   final int size;
//   final TextStyle? textStyle;

//   const ReusableRow({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.size,
//     required this.iconColor,
//     required this.textStyle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//         top: 12,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Container(
//               margin: const EdgeInsets.only(right: 12),
//               child: Icon(
//                 icon,
//                 color: iconColor,
//                 size: size.toDouble(),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Text(
//               text,
//               style: textStyle,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

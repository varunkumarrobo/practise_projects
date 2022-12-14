// import 'dart:io';
// import 'package:cricket_app/screens/auth_screens/login_screen.dart';
// import 'package:cricket_app/widgets/narrow_custom_button.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../widgets/bottom_right_positioned_camera_icon.dart';
// import '../../../widgets/custom_clip.dart';
// import '../../../widgets/status_bar.dart';
// import '../../../utils/validators.dart' as validators;
// import '../../../widgets/wide_custom_button.dart';
// import '../../../widgets/custom_radio_button.dart';
// import '../../../screens/set_password_screen.dart';
// import '../../../constants/styles.dart' as styles;
// import '../../../utils/get_asset.dart' as asset_util;
//
// class AddPlayerScreen extends StatefulWidget {
//   const AddPlayerScreen({super.key});
//
//   static const routeName = '/add-player';
//
//   @override
//   State<AddPlayerScreen> createState() => _AddPlayerScreenState();
// }
//
// class _AddPlayerScreenState extends State<AddPlayerScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   String? _name;
//   String? _email;
//   String? _phoneNumber;
//   String? _city;
//
//   final List<List<String>> _genders = [
//     ['Male', 'Female'],
//   ];
//
//   String _selectedGender = 'Male';
//
//   File? _storeImage;
//
//   @override
//   void initState() {
//     asset_util
//         .getImageFromAssets(
//       'assets/images/profile.png',
//     )
//         .then((file) => _storeImage = file);
//     super.initState();
//   }
//
//   void _changeGender(String? value) {
//     setState(() {
//       _selectedGender = value!;
//     });
//   }
//
//   var _isLandscape = false;
//
//   void _submitHandler() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       Navigator.of(context).pushNamed(SetPasswordScreen.routeName, arguments: {
//         'name': _name,
//         'email': _email,
//         'phoneNumber': _phoneNumber,
//         'city': _city,
//         'gender': _selectedGender,
//         'file': _storeImage
//       });
//     }
//   }
//
//   void _setLandscape(bool value) {
//     setState(() {
//       _isLandscape = value;
//     });
//   }
//
//   @override
//   void didChangeDependencies() {
//     if (MediaQuery.of(context).size.width > 400) {
//       _setLandscape(true);
//     } else {
//       _setLandscape(false);
//     }
//     super.didChangeDependencies();
//   }
//
//   void _saveName(String? name) {
//     setState(() {
//       _name = name;
//     });
//   }
//
//   void _saveEmail(String? email) {
//     setState(() {
//       _email = email;
//     });
//   }
//
//   void _savePhoneNumber(String? phoneNumber) {
//     setState(() {
//       _phoneNumber = phoneNumber;
//     });
//   }
//
//   void _saveCity(String? city) {
//     setState(() {
//       _city = city;
//     });
//   }
//
//   Future pickImage() async {
//     final image = ImagePicker().pickImage(source: ImageSource.gallery);
//     image.then((value) {
//       _storeImage = File(value!.path);
//       setState(() {});
//     });
//   }
//
//   bool dStatus = false;
//   bool eStatus = false;
//   bool batStatus = false;
//   bool bowStatus = false;
//   bool bowTypeStatus = false;
//   bool on = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const StatusBar(),
//                 Column(
//                   children: [
//                     Stack(
//                       children: [
//                         ClipPath(
//                           clipper: CustomClips(),
//                           child: SizedBox(
//                             height: 200,
//                             width: double.infinity,
//                             child: Image.asset(
//                               'assets/images/register_screen_background.png',
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                         ClipPath(
//                           clipper: CustomClips(),
//                           child: Container(
//                             height: 200,
//                             width: double.infinity,
//                             color: const Color.fromRGBO(14, 96, 208, 0.7),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.of(context).pushReplacementNamed(
//                                     LoginScreen.routeName);
//                               },
//                               icon: const Icon(
//                                 Icons.arrow_back,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(width: 30),
//                             const Text(
//                               'Add Player',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           left: (MediaQuery.of(context).size.width) / 2 - 60,
//                           child: Stack(
//                             children: [
//                               _storeImage == null
//                                   ? const CircleAvatar(
//                                 radius: 60,
//                                 backgroundColor:
//                                 Color.fromRGBO(255, 255, 255, 0.2),
//                                 child: CircleAvatar(
//                                   radius: 50,
//                                   backgroundImage: AssetImage(
//                                     'assets/images/profile.png',
//                                   ),
//                                 ),
//                               )
//                                   : CircleAvatar(
//                                 radius: 60,
//                                 backgroundColor:
//                                 const Color.fromRGBO(255, 255, 255, 0.2),
//                                 child: CircleAvatar(
//                                   radius: 50,
//                                   backgroundImage:
//                                   FileImage(_storeImage as File),
//                                 ),
//                               ),
//                               BottomRightPositionedCameraIcon(
//                                 onTapHandler: () {
//                                   pickImage();
//                                   setState(() {});
//                                 },
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 50,
//                             ),
//                             child: Column(
//                               children: [
//                                 TextFormField(
//                                   style: styles.kTextFormFieldStyle,
//                                   decoration: InputDecoration(
//                                     labelText: 'Player Name',
//                                     floatingLabelStyle:
//                                     styles.kFloatingLabelStyle,
//                                     floatingLabelBehavior:
//                                     FloatingLabelBehavior.auto,
//                                     labelStyle: styles.kLabelStyle,
//                                     enabledBorder: styles.kEnabledBorder,
//                                     focusedBorder: styles.kFocusedBorder,
//                                     errorBorder: styles.kErrorBorder,
//                                   ),
//                                   validator: validators.nameValidator,
//                                   onSaved: _saveName,
//                                   keyboardType: TextInputType.name,
//                                   textInputAction: TextInputAction.next,
//                                 ),
//                                 TextFormField(
//                                   style: styles.kTextFormFieldStyle,
//                                   decoration: InputDecoration(
//                                     labelText: 'City / Town (Optional)',
//                                     floatingLabelStyle:
//                                     styles.kFloatingLabelStyle,
//                                     floatingLabelBehavior:
//                                     FloatingLabelBehavior.auto,
//                                     labelStyle: styles.kLabelStyle,
//                                     enabledBorder: styles.kEnabledBorder,
//                                     focusedBorder: styles.kFocusedBorder,
//                                     errorBorder: styles.kErrorBorder,
//                                   ),
//                                   onSaved: _saveCity,
//                                   keyboardType: TextInputType.text,
//                                   textInputAction: TextInputAction.done,
//                                 ),
//                                 TextFormField(
//                                   style: styles.kTextFormFieldStyle,
//                                   decoration: InputDecoration(
//                                     labelText: 'Phone No, (Optional)',
//                                     floatingLabelStyle:
//                                     styles.kFloatingLabelStyle,
//                                     floatingLabelBehavior:
//                                     FloatingLabelBehavior.auto,
//                                     labelStyle: styles.kLabelStyle,
//                                     enabledBorder: styles.kEnabledBorder,
//                                     focusedBorder: styles.kFocusedBorder,
//                                     errorBorder: styles.kErrorBorder,
//                                   ),
//                                   validator: validators.phoneNumberValidator,
//                                   onSaved: _savePhoneNumber,
//                                   keyboardType: TextInputType.number,
//                                   textInputAction: TextInputAction.next,
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Container(
//                                   height: 130,
//                                   width: 300,
//                                   color: Colors.white70,
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           const Text('Designation : ',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600,
//                                               color: Color(0xff999999),),
//                                           ),
//                                           Switch(
//                                             // thumb color (round icon)
//                                             activeColor: const Color(0xffF0B769),
//                                             activeTrackColor: const Color(0xffF0B769),
//                                             inactiveThumbColor: const Color(0xffF1F1F1),
//                                             inactiveTrackColor: Colors.grey.shade400,
//                                             splashRadius: 50.0,
//                                             // boolean variable value
//                                             value: dStatus,
//                                             // changes the state of the switch
//                                             onChanged: (value) => setState(()
//                                             => dStatus = value),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 20,),
//                                       CustomRadioButton(
//                                         data: _genders,
//                                         groupValue: _selectedGender,
//                                         changeHandler: _changeGender,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Divider(thickness: 1,height: 2,color: Color(0xffE0E0E0),),
//                                 Container(
//                                   height: 200,
//                                   width: 300,
//                                   color: Colors.cyanAccent,
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           const Text('Expertise : ',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600,
//                                               color: Color(0xff999999),),),
//                                           Switch(
//                                             // thumb color (round icon)
//                                             activeColor: const Color(0xffF0B769),
//                                             activeTrackColor: const Color(0xffF0B769),
//                                             inactiveThumbColor: const Color(0xffF1F1F1),
//                                             inactiveTrackColor: Colors.grey.shade400,
//                                             splashRadius: 50.0,
//                                             // boolean variable value
//                                             value: eStatus,
//                                             // changes the state of the switch
//                                             onChanged: (value) => setState(()
//                                             => eStatus = value),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 20,),
//                                       CustomRadioButton(
//                                         data: _genders,
//                                         groupValue: _selectedGender,
//                                         changeHandler: _changeGender,
//                                       ),
//                                       CustomRadioButton(
//                                         data: _genders,
//                                         groupValue: _selectedGender,
//                                         changeHandler: _changeGender,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 130,
//                                   width: 300,
//                                   color: Colors.white70,
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           const Text('Batting : ',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600,
//                                               color: Color(0xff999999),),),
//                                           Switch(
//                                             // thumb color (round icon)
//                                             activeColor: const Color(0xffF0B769),
//                                             activeTrackColor: const Color(0xffF0B769),
//                                             inactiveThumbColor: const Color(0xffF1F1F1),
//                                             inactiveTrackColor: Colors.grey.shade400,
//                                             splashRadius: 50.0,
//                                             // boolean variable value
//                                             value: batStatus,
//                                             // changes the state of the switch
//                                             onChanged: (value) => setState(()
//                                             => batStatus = value),
//                                           ),
//                                         ],
//                                       ),
//                                       CustomRadioButton(
//                                         data: _genders,
//                                         groupValue: _selectedGender,
//                                         changeHandler: _changeGender,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 130,
//                                   width: 300,
//                                   color: Colors.white70,
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           const Text('Bowling : ',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600,
//                                               color: Color(0xff999999),),),
//                                           Switch(
//                                             // thumb color (round icon)
//                                             activeColor: const Color(0xffF0B769),
//                                             activeTrackColor: const Color(0xffF0B769),
//                                             inactiveThumbColor: const Color(0xffF1F1F1),
//                                             inactiveTrackColor: Colors.grey.shade400,
//                                             splashRadius: 50.0,
//                                             // boolean variable value
//                                             value: bowStatus,
//                                             // changes the state of the switch
//                                             onChanged: (value) => setState(()
//                                             => bowStatus = value),
//                                           ),
//                                         ],
//                                       ),
//                                       CustomRadioButton(
//                                         data: _genders,
//                                         groupValue: _selectedGender,
//                                         changeHandler: _changeGender,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 130,
//                                   width: 300,
//                                   color: Colors.white70,
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           const Text('Bowling Type : ',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600,
//                                               color: Color(0xff999999),),),
//                                           Switch(
//                                             // thumb color (round icon)
//                                             activeColor: const Color(0xffF0B769),
//                                             activeTrackColor: const Color(0xffF0B769),
//                                             inactiveThumbColor: const Color(0xffF1F1F1),
//                                             inactiveTrackColor: Colors.grey.shade400,
//                                             splashRadius: 50.0,
//                                             // boolean variable value
//                                             value: bowTypeStatus,
//                                             // changes the state of the switch
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 on = !on;
//                                                 bowTypeStatus = value;
//                                               });
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 20,),
//                                       on? CustomRadioButton(
//                                         data: _genders,
//                                         groupValue: _selectedGender,
//                                         changeHandler: _changeGender,
//                                       ): const SizedBox(),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20,),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 // if (_isLandscape ||
//                 //     (!_isLandscape &&
//                 //         MediaQuery.of(context).viewInsets.bottom != 0))
//                 //   const SizedBox(height: 10),
//                 // if (_isLandscape ||
//                 //     (!_isLandscape &&
//                 //         MediaQuery.of(context).viewInsets.bottom != 0))
//                 //   WideCustomButton(
//                 //     text: 'SAVE',
//                 //     onPressed: _submitHandler,
//                 //   ),
//               ],
//             ),
//           ),
//           const StatusBar(),
//           // if (!_isLandscape && MediaQuery.of(context).viewInsets.bottom == 0)
//           // Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child:
//           //   WideCustomButton(text: 'SAVE', onPressed: _submitHandler),
//           // ),
//         ],
//       ),
//       bottomNavigationBar: WideCustomButton(text: 'SAVE', onPressed: _submitHandler),
//     );
//   }
//
// // TextFormField(
// //   style: styles.kTextFormFieldStyle,
// //   decoration: InputDecoration(
// //     labelText: '* Email',
// //     floatingLabelStyle:
// //     styles.kFloatingLabelStyle,
// //     floatingLabelBehavior:
// //     FloatingLabelBehavior.auto,
// //     labelStyle: styles.kLabelStyle,
// //     enabledBorder: styles.kEnabledBorder,
// //     focusedBorder: styles.kFocusedBorder,
// //     errorBorder: styles.kErrorBorder,
// //   ),
// //   validator: validators.emailValidator,
// //   onSaved: _saveEmail,
// //   keyboardType: TextInputType.emailAddress,
// //   textInputAction: TextInputAction.next,
// // ),
// }

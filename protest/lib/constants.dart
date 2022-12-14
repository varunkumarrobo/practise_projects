import 'package:flutter/material.dart';

  InputDecoration ktextfielddecoration = const InputDecoration(
  floatingLabelStyle: TextStyle(color: Colors.grey),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
  border: UnderlineInputBorder(),
    // labelText: 'Enter your username',
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  labelStyle: TextStyle(
    textBaseline: TextBaseline.alphabetic,
  ),
);


// MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
//   const Color color =  Colors.grey;
//   // states.contains(MaterialState.error)
//   //     ? Theme.of(context).colorScheme.error
//   //     : Colors.orange;
//   // return TextStyle(color: color, letterSpacing: 1.3);
// }),



// class CustomSmallTextFormField extends StatefulWidget {
//   const CustomSmallTextFormField(
//       {Key? key, required this.textFieldType, this.label})
//       : super(key: key);
//   final TextFieldType textFieldType;
//   final String? label;
//
//   @override
//   State<CustomSmallTextFormField> createState() =>
//       _CustomSmallTextFormFieldState();
// }

// class _CustomSmallTextFormFieldState extends State<CustomSmallTextFormField> {
//   bool visibilityController = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           // height: 50,
//           width: 150,
//           child: Container(
//             // color: Colors.green,
//             child: TextFormField(
//               cursorColor: Colors.orangeAccent,
//               keyboardType: widget.textFieldType == TextFieldType.mobile
//                   ? TextInputType.number
//                   : TextInputType.text,
//               validator: (value) {
//                 return getValidator(
//                     textFieldType: widget.textFieldType, data: value);
//               },
//               textInputAction: widget.textFieldType == TextFieldType.password
//                   ? TextInputAction.done
//                   : TextInputAction.next,
//               style: GoogleFonts.roboto(
//                 fontSize: 20,
//                 color: const Color(0xFF4F504F),
//               ),
//               obscureText: widget.textFieldType == TextFieldType.password
//                   ? visibilityController
//                   : false,
//               obscuringCharacter: 'x',
//               decoration: InputDecoration(
//                 floatingLabelBehavior: FloatingLabelBehavior.auto,
//                 contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                 // hintText: 'Mobile',
//                 // prefixIcon: Container(
//                 //   // color: Colors.red,
//                 //   child: Image.asset(
//                 //     getPreffixIcon(textFieldType: widget.textFieldType),
//                 //     scale: 2.5,
//                 //   ),
//                 // ),
//                 labelText: getLabel(
//                     textFieldType: widget.textFieldType, label: widget.label),
//                 labelStyle: GoogleFonts.roboto(
//                   color: const Color(0xFF4F504F).withOpacity(0.8),
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 floatingLabelStyle: GoogleFonts.roboto(
//                   color: const Color(0xFFBDBDBD),
//                   fontSize: 22.5,
//                 ),
//                 border: const UnderlineInputBorder(),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 errorBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 errorStyle: GoogleFonts.roboto(
//                   color: Colors.orangeAccent,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                 ),
//
//                 // focusedBorder: const OutlineInputBorder(
//                 //   borderSide: BorderSide.none,
//                 // ),
//                 suffixIcon: widget.textFieldType == TextFieldType.date
//                     ? Image.asset(
//                   'assets/images/create_trip/date.png',
//                   scale: 2.5,
//                 )
//                     : widget.textFieldType == TextFieldType.clock
//                     ? Image.asset(
//                   'assets/images/create_trip/clock.png',
//                   scale: 2.5,
//                 )
//                     : null,
//
//                 counterText: '',
//               ),
//               maxLength:
//               widget.textFieldType == TextFieldType.mobile ? 10 : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

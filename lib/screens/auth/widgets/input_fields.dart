// import 'package:flutter/material.dart';

// class InputTextFieldWidget extends StatefulWidget {
//   final TextEditingController textEditingController;
//   final String hintText;
//   final bool isPassword;

//   InputTextFieldWidget({
//     required this.textEditingController,
//     required this.hintText,
//     this.isPassword = false,
//   });

//   @override
//   _InputTextFieldWidgetState createState() => _InputTextFieldWidgetState();
// }

// class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
//   bool isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: Color.fromARGB(255, 255, 255, 255),
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 5,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: TextField(
//           controller: widget.textEditingController,
//           obscureText: widget.isPassword && !isPasswordVisible,
//           style: const TextStyle(
//             color: Colors.black87,
//             fontSize: 16,
//           ),
//           decoration: InputDecoration(
//             hintText: widget.hintText,
//             hintStyle: TextStyle(
//               color: Colors.grey[500],
//               fontSize: 16,
//             ),
//             border: InputBorder.none,
//             suffixIcon: widget.isPassword
//                 ? IconButton(
//                     icon: Icon(
//                       isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isPasswordVisible = !isPasswordVisible;
//                       });
//                     },
//                   )
//                 : null,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;

  InputTextFieldWidget({
    required this.textEditingController,
    required this.hintText,
    this.isPassword = false,
    this.validator,
  });

  @override
  _InputTextFieldWidgetState createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: widget.textEditingController,
          obscureText: widget.isPassword && !isPasswordVisible,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
            ),
            border: InputBorder.none,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  )
                : null,
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}

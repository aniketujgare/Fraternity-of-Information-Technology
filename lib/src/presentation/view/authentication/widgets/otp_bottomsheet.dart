// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../utils/constants/constants.dart';
// import '../../../blocs/auth_bloc/auth_bloc.dart';
// import '../../../widgets/fit_button.dart';
// import '../../../widgets/fit_circular_loading_indicator.dart';

// class OtpBottomSheet extends StatefulWidget {
//   const OtpBottomSheet({super.key});

//   @override
//   State<OtpBottomSheet> createState() => _OtpBottomSheetState();
// }

// class _OtpBottomSheetState extends State<OtpBottomSheet> {
//   List<String> otp = List.filled(6, '');
//   List<FocusNode> focusNodes = [];

//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < 6; i++) {
//       focusNodes.add(FocusNode());
//     }
//   }

//   @override
//   void dispose() {
//     for (var node in focusNodes) {
//       node.dispose();
//     }
//     super.dispose();
//   }

//   void handleOtpInputChange(String value, int index) {
//     setState(() {
//       otp[index] = value;
//     });
//     if (value.isNotEmpty && index < 5) {
//       focusNodes[index + 1].requestFocus();
//     } else if (index == 5) {
//       focusNodes[index].unfocus();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       height: kHeight(context) * 0.45,
//       width: kWidth(context),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: Colors.white,
//           ),
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(25))),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               top: 35,
//               left: kWidth(context) * 0.2,
//               right: kWidth(context) * 0.2,
//               bottom: 15,
//             ),
//             child: const FittedBox(
//               child: Text(
//                 'OTP Verification',
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: kWidth(context) * 0.1,
//               right: kWidth(context) * 0.1,
//             ),
//             child: const FittedBox(
//               child: Text(
//                 'Enter the verification code we’ve just sent to the \n+91 8888190935',
//                 style: TextStyle(
//                   fontSize: 10,
//                   color: kTextGreyColor,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 35,
//               left: kWidth(context) * 0.1,
//               right: kWidth(context) * 0.1,
//               bottom: 20,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: List.generate(6, (index) {
//                 return _buildOtpBoxes(index);
//               }),
//             ),
//           ),
//           BlocBuilder<AuthBloc, AuthState>(
//             builder: (context, state) {
//               if (state is AuthLoading) {
//                 return const FITCircularLoadingIndicator();
//               }
//               if (state is PhoneAuthCodeSentSuccess) {
//                 return FitButton(
//                   onTap: () async {
//                     String enteredOtp = otp.join();
//                     context.read<AuthBloc>().add(VerifySentOtpEvent(
//                         otpCode: enteredOtp,
//                         verificationId: state.verificationId));
//                     // Navigator.of(context).pushNamed('/updateAccount');
//                   },
//                   text: 'Verify',
//                   height: 50,
//                   tMargin: 20,
//                   hMargin: 35,
//                   showArrow: false,
//                 );
//               } else {
//                 return Container();
//               }
//             },
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: 20,
//               left: kWidth(context) * 0.1,
//               right: kWidth(context) * 0.1,
//               // bottom: 20,
//             ),
//             child: const Text(
//               'Resend code in 00:45',
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: kTextGreyColor,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   SizedBox _buildOtpBoxes(int index) {
//     Color bordercol = const Color(0xffc2c8d0);
//     return SizedBox(
//       height: 45,
//       width: 45,
//       child: TextFormField(
//         focusNode: focusNodes[index],
//         style: const TextStyle(
//           fontSize: 26,
//           fontWeight: FontWeight.w500,
//           color: kTextGreyColor,
//         ),
//         onChanged: (value) => handleOtpInputChange(value, index),
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//           FilteringTextInputFormatter.digitsOnly
//         ],
//         decoration: InputDecoration(
//           counterText: '',
//           contentPadding: const EdgeInsets.only(top: 0, left: 3),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: kPrimaryColor, width: 2),
//             borderRadius: BorderRadius.all(
//               Radius.circular(11),
//             ),
//           ),
//           disabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: bordercol, width: 2),
//               borderRadius: const BorderRadius.all(Radius.circular(11))),
//           enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: bordercol, width: 2),
//               borderRadius: const BorderRadius.all(Radius.circular(11))),
//         ),
//       ),
//     );
//   }
// }

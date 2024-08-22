//
// class VerificationPage extends StatefulWidget {
//   final String mail;
//   final String type;
//   const VerificationPage({super.key, required this.mail, required this.type});
//
//   @override
//   State<VerificationPage> createState() => _VerificationPageState();
// }
//
// class _VerificationPageState extends State<VerificationPage> {
//   final VerificationController _verificationController =
//       Get.put(VerificationController());
//   final ForgotPasswordController _forgotPasswordController =
//       Get.put(ForgotPasswordController());
//   final SendOtpController _sendOtpController = Get.find<SendOtpController>();
//   bool isActive = false;
//   bool isLoading = false;
//   bool isSending = false;
//
//   final List<TextEditingController> otpController =
//       List.generate(4, (index) => TextEditingController());
//
//   bool _areAllFieldsFilled() {
//     return otpController.every((controller) => controller.text.isNotEmpty);
//   }
//
//   @override
//   void dispose() {
//     for (var element in otpController) {
//       element.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           //mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 60),
//             Center(
//               child: Text(
//                 "Verification",
//                 style: GoogleFonts.mulish(
//                   fontSize: 27,
//                   fontWeight: FontWeight.w400,
//                   color: CustomColors.wineBerry,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: Text(
//                 "Enter the four digit code sent to your \nemail",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.mulish(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: CustomColors.wineBerry,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 60),
//             Center(
//               child: Text(
//                 "Verification code",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.mulish(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: CustomColors.wineBerry,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int i = 0; i < 4; i++)
//                   VerificationTextfield(
//                     controller: otpController[i],
//                     onChanged: (value) {
//                       if (value.length == 1 && i < 3) {
//                         FocusScope.of(context).nextFocus();
//                       } else if (value.isEmpty && i > 0) {
//                         FocusScope.of(context).previousFocus();
//                       }
//                       if (_areAllFieldsFilled()) {
//                         setState(() {
//                           isActive = true;
//                         });
//                       } else {
//                         setState(() {
//                           isActive = false;
//                         });
//                       }
//                     },
//                   ),
//               ],
//             ),
//             const SizedBox(height: 50),
//             CustomButton(
//               loading: isLoading
//                   ? const SizedBox(
//                       height: 25,
//                       width: 25,
//                       child: CircularProgressIndicator(
//                         color: CustomColors.white,
//                         strokeWidth: 2,
//                       ),
//                     )
//                   : null,
//               onTap: isActive && !isLoading
//                   ? () async {
//                       setState(() {
//                         isLoading = true;
//                       });
//                       if (widget.type == "verification") {
//                         await _verificationController.verifyUser(
//                             mail: widget.mail,
//                             otp: otpController[0].text +
//                                 otpController[1].text +
//                                 otpController[2].text +
//                                 otpController[3].text,
//                             context: context);
//                       } else {
//                         await _forgotPasswordController.forgotPassword(
//                             email: widget.mail,
//                             otp: otpController[0].text +
//                                 otpController[1].text +
//                                 otpController[2].text +
//                                 otpController[3].text,
//                             context: context);
//                       }
//                       setState(() {
//                         isLoading = false;
//                       });
//                     }
//                   : null,
//               shadowColor: CustomColors.lightWineBerry,
//               buttonName: "Confirm",
//               buttonNameColor: Colors.white,
//               buttonColor: CustomColors.wineBerry,
//             ),
//             const SizedBox(height: 20),
//             Align(
//               alignment: Alignment.center,
//               child: Obx(() {
//                 return RichText(
//                     text: TextSpan(style: GoogleFonts.workSans(), children: [
//                   TextSpan(
//                       text: "Resend code after: ",
//                       style: TextStyle(
//                           color: CustomColors.shadowBlack,
//                           fontWeight: FontWeight.w300)),
//                   TextSpan(
//                       text: _verificationController.timer.value,
//                       style: const TextStyle(
//                           color: CustomColors.wineBerry,
//                           fontWeight: FontWeight.bold))
//                 ]));
//               }),
//             ),
//             Obx(() => TextButton(
//                   onPressed:
//                       _verificationController.isTimerRunning.value || isSending
//                           ? null
//                           : () async {
//                               setState(() {
//                                 isSending = true;
//                               });
//                               final isSent = await _sendOtpController
//                                   .sendOtpWithEmail(email: widget.mail);
//                               setState(() {
//                                 isSending = false;
//                               });
//
//                               if (isSent) {
//                                 _verificationController.startTimer();
//                                 Methods.showSnackBar('Code sent successfully',
//                                     context: context);
//                               }
//                             },
//                   child: Text(
//                     isSending ? "Resending Code" : "Resend Code",
//                     style: GoogleFonts.mulish(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 14,
//                       color:  _verificationController.isTimerRunning.value || isSending ? CustomColors.charcoal: CustomColors.wineBerry,
//                     ),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

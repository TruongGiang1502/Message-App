import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/common/utils/colors.dart';
import 'package:message_app/common/widgets/custom_button.dart';
import 'package:message_app/common/widgets/otp_input_field.dart';
import 'package:message_app/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  static const routeName = '/otp_screen';
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authControllerProvider).verifyOTP(
          context,
          verificationId,
          userOTP,
        );
  }

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController otp1 = TextEditingController();
    TextEditingController otp2 = TextEditingController();
    TextEditingController otp3 = TextEditingController();
    TextEditingController otp4 = TextEditingController();
    TextEditingController otp5 = TextEditingController();
    TextEditingController otp6 = TextEditingController();
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Verifying your number'),
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            const Text('We have sent and SMS with a code'),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpInputField(
                  controller: otp1,
                  size: size,
                  isFinalValue: false,
                ),
                OtpInputField(
                  controller: otp2,
                  size: size,
                  isFinalValue: false,
                ),
                OtpInputField(
                  controller: otp3,
                  size: size,
                  isFinalValue: false,
                ),
                OtpInputField(
                  controller: otp4,
                  size: size,
                  isFinalValue: false,
                ),
                OtpInputField(
                  controller: otp5,
                  size: size,
                  isFinalValue: false,
                ),
                OtpInputField(
                  controller: otp6,
                  size: size,
                  isFinalValue: true,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
                width: size.width * 0.5,
                child: CustomButton(
                    onPressed: () {
                      String inputOTP = '';
                      inputOTP += (
                          otp1.text +
                          otp2.text +
                          otp3.text +
                          otp4.text +
                          otp5.text +
                          otp6.text
                        );
                      otp1.dispose;
                      otp2.dispose;
                      otp3.dispose;
                      otp4.dispose;
                      otp5.dispose;
                      otp6.dispose;
                      verifyOTP(ref, context, inputOTP);
                    },
                    text: 'Confirm')
              ),
          ],
        ),
      ),
    );
  }
}

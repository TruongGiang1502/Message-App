import 'package:country_flags/country_flags.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:message_app/common/utils/colors.dart';
import 'package:message_app/common/utils/utils.dart';
import 'package:message_app/common/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login_screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneNumberController = TextEditingController();

  //Setup default country is Vietnam
  Country country = Country(
      phoneCode: "84",
      countryCode: "VN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Vietnam",
      example: "912345678",
      displayName: "Vietnam (VN) [+84]",
      displayNameNoCountryCode: "Vietnam (VN)",
      e164Key: "84-VN-0",
      fullExampleWithPlusSign: "+84912345678",
      nameLocalized: null);

  //function to select country
  void pickCountry() {
    showCountryPicker(
        showPhoneCode: true,
        context: context,
        onSelect: (Country selectedCountry) {
          setState(() {
            country = selectedCountry;
          });
        });
  }

  //function to send the phone number to 
  void sendPhoneNumber() {
    String phoneNumber = phoneNumberController.text.trim();
    if (phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWihtPhone(context, '+${country.phoneCode}$phoneNumber');

    } else {
      showSnackBar(context: context, content: 'Pleas fill your phone number');
    }
  }

  //destruction
  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('Enter your phone number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Message App will need to verify your phone number'),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(161, 239, 230, 230),
                      border: Border.all(color: greycolor),
                      borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                    onTap: pickCountry,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CountryFlag.fromCountryCode(
                          country.countryCode,
                          height: size.height * 0.03,
                          width: size.width * 0.1,
                        ),
                        Text(
                          '+${country.phoneCode}',
                          style: const TextStyle(fontSize: 16),
                        ),
                   
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: size.width * 0.65,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    enabled: true,
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Your phone number',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              width: size.width * 0.2,
              child: CustomButton(onPressed: sendPhoneNumber, text: 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}

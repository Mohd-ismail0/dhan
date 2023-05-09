import 'package:dhanda_app/routes/app_route.dart';
import 'package:dhanda_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class IdentityDetailsScreen extends StatefulWidget {
  const IdentityDetailsScreen({super.key});

  @override
  State<IdentityDetailsScreen> createState() => _IdentityDetailsScreenState();
}

class _IdentityDetailsScreenState extends State<IdentityDetailsScreen> {
  GlobalKey<FormState> _identityFormKey = GlobalKey();

  late TextEditingController _nameController;
  late TextEditingController _businessNameController;
  late TextEditingController _gstNumberController;
  late TextEditingController _addressController;
  late TextEditingController _contactNumberController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _businessNameController = TextEditingController();
    _gstNumberController = TextEditingController();
    _addressController = TextEditingController();
    _contactNumberController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _businessNameController.dispose();
    _gstNumberController.dispose();
    _addressController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value!.length == 0) {
      return "name cannot be empty";
    }
    return null;
  }

  String? _validateBusinessName(String? value) {
    if (value!.length == 0) {
      return "business name cannot be empty";
    }
    return null;
  }

  String? _validateGST(String? value) {
    if (value!.length == 0) {
      return "GSTN cannot be empty";
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value!.length == 0) {
      return "Address cannot be empty";
    }
    return null;
  }

  String? _validateContact(String? value) {
    if (value!.length == 0) {
      return "Contact cannot be empty";
    }
    if (value.length < 10) {
      return "invalid number";
    }
    return null;
  }

  _submitData(context) {
    _identityFormKey.currentState?.save();
    // ignore: unused_local_variable
    bool? isValid = _identityFormKey.currentState?.validate();
    Navigator.pushNamed(context, AppRoute.businessDetail);
  }

  Text _label({required String text}) {
    return Text(
      text,
      style:
          TextStyle(color: AppTheme.kLightGreen, fontWeight: FontWeight.bold),
    );
  }

  TextFormField _textFormField(
      {required TextEditingController controller,
      required TextInputType keyboardType,
      final String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: AppTheme.kLightGreen,
      maxLines: null,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.kLightGreen)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.kLightGreen)),
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Identity",
              style: TextStyle(
                  color: AppTheme.kBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "We Just Need A Few Details\nTo Get You Started",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 30),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                    key: _identityFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label(text: "Your Name"),
                        _textFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            validator: _validateName),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Business Details",
                          style: TextStyle(
                              color: AppTheme.kRed,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _label(text: "Business Name"),
                        _textFormField(
                            controller: _businessNameController,
                            keyboardType: TextInputType.text,
                            validator: _validateBusinessName),
                        SizedBox(
                          height: 20,
                        ),
                        _label(text: "GSTN"),
                        _textFormField(
                            controller: _gstNumberController,
                            keyboardType: TextInputType.text,
                            validator: _validateGST),
                        SizedBox(
                          height: 20,
                        ),
                        _label(text: "Business Address"),
                        _textFormField(
                            controller: _addressController,
                            keyboardType: TextInputType.streetAddress,
                            validator: _validateAddress),
                        SizedBox(
                          height: 20,
                        ),
                        _label(text: "Contact No"),
                        _textFormField(
                            controller: _contactNumberController,
                            keyboardType: TextInputType.phone,
                            validator: _validateContact)
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () => _submitData(context),
                child: Text("Next"),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: AppTheme.kLightGreen,
                    foregroundColor: AppTheme.kWhite))
          ],
        ),
      )),
    );
  }
}

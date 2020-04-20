import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:klass_korporate/model/dropdown_datas.dart';
import 'package:klass_korporate/screens/widgets/roundButton.dart';
import 'package:klass_korporate/screens/widgets/textformfield.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:klass_korporate/screens/payment.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MultipurposeForm extends StatefulWidget {
  static const String id = 'multipurpose_form';

  @override
  _MultipurposeFormState createState() => _MultipurposeFormState();
}

class _MultipurposeFormState extends State<MultipurposeForm> {
  Networking networking = Networking();
  int _currentStep = 0;
  bool complete = false;
  String selectedGender;
  String selectedNationality;
  String selectedState;
  String selectedCountry;
  String selectedIdentityType;
  String designation1;
  String designation2;
  String designation3;
  String designation4;
  String designation5;
  bool disableDropDown = true;
  bool showSpinner = false;

  int designation1Id;
  int designation2Id;
  int designation3Id;
  int designation4Id;
  int designation5Id;
  GlobalKey<FormState> _MultiFormKey = GlobalKey<FormState>();

  final TextEditingController _prefferedNameController =
      TextEditingController();
  final TextEditingController _alternativeNameController =
      TextEditingController();
  final TextEditingController _registeredAddressController =
      TextEditingController();
  final TextEditingController _noOfMembersController = TextEditingController();
  final TextEditingController _filNameController = TextEditingController();
  final TextEditingController _filAddressController = TextEditingController();
  final TextEditingController _filEmailController = TextEditingController();
  final TextEditingController _filPhoneController = TextEditingController();
  final TextEditingController mFullName1Controller = TextEditingController();
  final TextEditingController mFullName2Controller = TextEditingController();
  final TextEditingController mFullName3Controller = TextEditingController();
  final TextEditingController mFullName4Controller = TextEditingController();
  final TextEditingController mFullName5Controller = TextEditingController();
  final TextEditingController mAddress1Controller = TextEditingController();
  final TextEditingController mAddress2Controller = TextEditingController();
  final TextEditingController mAddress3Controller = TextEditingController();
  final TextEditingController mAddress4Controller = TextEditingController();
  final TextEditingController mAddress5Controller = TextEditingController();
  final TextEditingController mEmail1Controller = TextEditingController();
  final TextEditingController mEmail2Controller = TextEditingController();
  final TextEditingController mEmail3Controller = TextEditingController();
  final TextEditingController mEmail4Controller = TextEditingController();
  final TextEditingController mEmail5Controller = TextEditingController();
  final TextEditingController _objectiveController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _prefferedNameController.dispose();
    _alternativeNameController.dispose();
    _registeredAddressController.dispose();
    _noOfMembersController.dispose();
    _filNameController.dispose();
    _filAddressController.dispose();
    _filEmailController.dispose();
    _filPhoneController.dispose();
    mFullName1Controller.dispose();
    mFullName2Controller.dispose();
    mFullName3Controller.dispose();
    mFullName4Controller.dispose();
    mFullName5Controller.dispose();
    mAddress1Controller.dispose();
    mAddress2Controller.dispose();
    mAddress3Controller.dispose();
    mAddress4Controller.dispose();
    mAddress5Controller.dispose();
    mEmail1Controller.dispose();
    mEmail2Controller.dispose();
    mEmail3Controller.dispose();
    mEmail4Controller.dispose();
    mEmail5Controller.dispose();
    _objectiveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Multipurpose Cooperative Request'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _MultiFormKey,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 600),
              child: FAStepper(
                steps: multipurposeStep(),
                currentStep: _currentStep,
                type: FAStepperType.horizontal,
                onStepTapped: (step) => goto(step),
                onStepCancel: cancel,
                onStepContinue:
                    _currentStep + 1 != multipurposeStep().length ? next : submit,
                physics: ClampingScrollPhysics(),
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        child: RoundedButton(
                          title: 'Back',
                          colour: Theme.of(context).primaryColor,
                          onPressed: onStepCancel,
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Container(
                        width: 150.0,
                        child: RoundedButton(
                          title: _currentStep + 1 != multipurposeStep().length
                              ? 'Next'
                              : 'Submit',
                          colour: Theme.of(context).primaryColor,
                          onPressed: onStepContinue,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  submit()async{
    if (_MultiFormKey.currentState.validate()) {
      _MultiFormKey.currentState.save();
      showSpinner = true;
      try {
        await postMultipurpose();
        Navigator.pushNamed(
            context, PaymentPage.id);
        showSpinner = false;
      }catch(e){
        print(e);
      }
    }
  }

  next() {
    if(_MultiFormKey.currentState.validate()){
      goto(_currentStep + 1);
    }
  }

  cancel() {
    if (_currentStep > 0) {
      goto(_currentStep - 1);
    }
  }

  goto(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  getList(List itemList) {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String item in itemList) {
      var newItem = DropdownMenuItem(
        child: Text(item),
        value: item,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  List<FAStep> multipurposeStep() {
    List<FAStep> step = [
      FAStep(
        isActive: _currentStep < 0 ? false : true,
        title: Text('Cooperative Details'),
        content: Column(
          children: <Widget>[
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Preferred Name',
              textEditingController: _prefferedNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Alternative Name',
              textEditingController: _alternativeNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Registered Address',
              maxLine: 2,
              textEditingController: _registeredAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Number of Members',
              textInputType: TextInputType.number,
              textEditingController: _noOfMembersController,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 1 ? false : true,
        title: Text('Filing'),
        content: Column(
          children: <Widget>[
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Filing Name',
              textEditingController: _filNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Filing Address',
              textEditingController: _filAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Filing Email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _filEmailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Filing Phone number',
              textInputType: TextInputType.number,
              textEditingController: _filPhoneController,
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 2 ? false : true,
        title: Text('Executive Members'),
        content: Column(
          children: <Widget>[
            Text(
              '1',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Full Name',
              textEditingController: mFullName1Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Address',
              textEditingController: mAddress1Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Filing Email',
              textInputType: TextInputType.emailAddress,
              textEditingController: mEmail1Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getDesignationsList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List designationList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(designationList),
                    value: designation1,
                    hint: Text(
                      'Designation',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        designation1 = _value;
                        designation1Id =
                            designationList.indexOf(designation1) + 1;
                      });
                    },
                  );
                } else {
                  return OutlineDropdownButtonFormField(
                    items: getList(['loading...']),
                    decoration: dropDownDecoration,
                  );
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '2',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Full Name',
              textEditingController: mFullName2Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Address',
              textEditingController: mAddress2Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Filing Email',
              textInputType: TextInputType.emailAddress,
              textEditingController: mEmail2Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getDesignationsList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List designationList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(designationList),
                    value: designation2,
                    hint: Text(
                      'Designation',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        designation2 = _value;
                        designation2Id =
                            designationList.indexOf(designation2) + 1;
                      });
                    },
                  );
                } else {
                  return OutlineDropdownButtonFormField(
                    items: getList(['loading...']),
                    decoration: dropDownDecoration,
                  );
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '3',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Full Name',
              textEditingController: mFullName3Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Address',
              textEditingController: mAddress3Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Filing Email',
              textInputType: TextInputType.emailAddress,
              textEditingController: mEmail3Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getDesignationsList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List designationList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(designationList),
                    value: designation3,
                    hint: Text(
                      'Designation',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        designation3 = _value;
                        designation3Id =
                            designationList.indexOf(designation3) + 1;
                      });
                    },
                  );
                } else {
                  return OutlineDropdownButtonFormField(
                    items: getList(['loading...']),
                    decoration: dropDownDecoration,
                  );
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '4',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Full Name',
              textEditingController: mFullName4Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Address',
              textEditingController: mAddress4Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Filing Email',
              textInputType: TextInputType.emailAddress,
              textEditingController: mEmail4Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getDesignationsList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List designationList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(designationList),
                    value: designation4,
                    hint: Text(
                      'Designation',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        designation4 = _value;
                        designation4Id =
                            designationList.indexOf(designation4) + 1;
                      });
                    },
                  );
                } else {
                  return OutlineDropdownButtonFormField(
                    items: getList(['loading...']),
                    decoration: dropDownDecoration,
                  );
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '5',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Full Name',
              textEditingController: mFullName5Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Address',
              textEditingController: mAddress5Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Filing Email',
              textInputType: TextInputType.emailAddress,
              textEditingController: mEmail5Controller,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getDesignationsList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List designationList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(designationList),
                    value: designation5,
                    hint: Text(
                      'Designation',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        designation5 = _value;
                        designation5Id =
                            designationList.indexOf(designation5) + 1;
                      });
                    },
                  );
                } else {
                  return OutlineDropdownButtonFormField(
                    items: getList(['loading...']),
                    decoration: dropDownDecoration,
                  );
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 3 ? false : true,
        title: Text('Objective'),
        content: Column(
          children: <Widget>[
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Objective',
              maxLine: 3,
              textEditingController: _objectiveController,
            ),
          ],
        ),
      ),
    ];
    return step;
  }

  Future<void> postMultipurpose() async{
    String url = 'https://klasskorporate.com/api/multicooperatives';
    Map<String, dynamic> map = {
      "preferred_name": _prefferedNameController.text,
      "alternative_name": _alternativeNameController.text,
      "address": _registeredAddressController.text,
      "number_of_members": _noOfMembersController.text,
      "filing_name": _filNameController.text,
      "filing_address": _filAddressController.text,
      "filing_phone_number": _filPhoneController.text,
      "filing_email": _filEmailController.text,
      "objective": _objectiveController.text,
      "member_name": [
        mFullName1Controller.text,
        mFullName2Controller.text,
        mFullName3Controller.text,
        mFullName4Controller.text,
        mFullName5Controller.text
      ],
      "member_address": [
        mAddress1Controller.text,
        mAddress2Controller.text,
        mAddress3Controller.text,
        mAddress4Controller.text,
        mAddress5Controller.text
      ],
      "member_designation_id": [
        designation1Id,
        designation2Id,
        designation3Id,
        designation4Id,
        designation5Id
      ]
    };
    await networking.postOther(urls: url,map: map);
  }
}

import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:klass_korporate/model/classification_model.dart';
import 'package:klass_korporate/model/dropdown_datas.dart';
import 'package:klass_korporate/screens/name_reserve_form.dart';
import 'package:klass_korporate/screens/widgets/roundButton.dart';
import 'package:klass_korporate/screens/widgets/textformfield.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:klass_korporate/screens/payment.dart';

class NgoForm extends StatefulWidget {
  static const String id = 'ngo_form';

  @override
  _NgoFormState createState() => _NgoFormState();
}

class _NgoFormState extends State<NgoForm> {
  Networking networking = Networking();
  Classification classification = Classification();
  int _currentStep = 0;
  bool complete = false;
  String selectedGender;
  String genderSelected;
  String selectedState;
  String selectedNationality;
  String selectedState5;
  String ngoState1;
  int ngoState1Id;
  String selectedState2;
  String selectedState3;
  String selectedState4;
  String selectedState6;
  String selectedCountry;
  String selectedIdentityType;
  String selectedOccupation;
  bool disableDropDown = true;
  bool haveNameReservationCode = true;
  bool yes = false;
  bool no = false;
  int answerindex;
  String answer;
  String selectedClassification;
  String specificTypeSelect;
  int checkersInt;
  int specificTypeId;
  bool check;
  String noState1;
  int noState1Id;

  String trusteeState1;
  String trusteeState2;
  String trusteeState3;
  String trusteeState4;
  int trusteeState1Id;
  int trusteeState2Id;
  int trusteeState3Id;
  int trusteeState4Id;

  String trusteeNationality1;
  String trusteeNationality2;
  String trusteeNationality3;
  String trusteeNationality4;
  int trusteeNationality1Id;
  int trusteeNationality2Id;
  int trusteeNationality3Id;
  int trusteeNationality4Id;

  int trusteeOccupation1Id;
  int trusteeOccupation2Id;
  int trusteeOccupation3Id;
  int trusteeOccupation4Id;
  String trusteeOccupation1;
  String trusteeOccupation2;
  String trusteeOccupation3;
  String trusteeOccupation4;

  int trusteeIdentityType1Id;
  int trusteeIdentityType2Id;
  int trusteeIdentityType3Id;
  int trusteeIdentityType4Id;
  String trusteeIdentityType1;
  String trusteeIdentityType2;
  String trusteeIdentityType3;
  String trusteeIdentityType4;
  String tGender1;
  String tGender2;
  String tGender3;
  String tGender4;

  String secState;
  int secStateId;

  final TextEditingController _preferredNameCont = TextEditingController();
  final TextEditingController _alternativeNameCont = TextEditingController();
  final TextEditingController _regOfficeAddressContr = TextEditingController();
  final TextEditingController _emailContr = TextEditingController();
  final TextEditingController _cityContr = TextEditingController();

  final TextEditingController _organisationController = TextEditingController();
  final TextEditingController _availabityCodeController =
      TextEditingController();
  final TextEditingController _regOfficeAddressController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _objectController = TextEditingController();
  final TextEditingController _constitutionController = TextEditingController();

  final TextEditingController _trusteeNameController = TextEditingController();
  final TextEditingController _trusteeNameController2 = TextEditingController();
  final TextEditingController _trusteeNameController3 = TextEditingController();
  final TextEditingController _trusteeNameController4 = TextEditingController();

  final TextEditingController _trusteeEmailController = TextEditingController();
  final TextEditingController _trusteeEmailController2 =
      TextEditingController();
  final TextEditingController _trusteeEmailController3 =
      TextEditingController();
  final TextEditingController _trusteeEmailController4 =
      TextEditingController();

  final TextEditingController _trusteePhoneController = TextEditingController();
  final TextEditingController _trusteePhoneController2 =
      TextEditingController();
  final TextEditingController _trusteePhoneController3 =
      TextEditingController();
  final TextEditingController _trusteePhoneController4 =
      TextEditingController();

  final TextEditingController _trusteeAddressController =
      TextEditingController();
  final TextEditingController _trusteeAddressController3 =
      TextEditingController();
  final TextEditingController _trusteeAddressController2 =
      TextEditingController();
  final TextEditingController _trusteeAddressController4 =
      TextEditingController();

  final TextEditingController _trusteeCityController = TextEditingController();
  final TextEditingController _trusteeCityController2 = TextEditingController();
  final TextEditingController _trusteeCityController3 = TextEditingController();
  final TextEditingController _trusteeCityController4 = TextEditingController();

  final TextEditingController _trusteeDateController = TextEditingController();
  final TextEditingController _trusteeDateController2 = TextEditingController();
  final TextEditingController _trusteeDateController3 = TextEditingController();
  final TextEditingController _trusteeDateController4 = TextEditingController();

  final TextEditingController _trusteeIdentityNumberController =
      TextEditingController();
  final TextEditingController _trusteeIdentityNumberController2 =
      TextEditingController();
  final TextEditingController _trusteeIdentityNumberController3 =
      TextEditingController();
  final TextEditingController _trusteeIdentityNumberController4 =
      TextEditingController();

  final TextEditingController _secNameController = TextEditingController();
  final TextEditingController _secOtherNameController = TextEditingController();
  final TextEditingController _secEmailController = TextEditingController();
  final TextEditingController _secPhoneController = TextEditingController();
  final TextEditingController _secAddressController = TextEditingController();
  final TextEditingController _secCityController = TextEditingController();
  final TextEditingController _secAccreditationController =
      TextEditingController();
  final TextEditingController _secObjectController = TextEditingController();

  final TextEditingController _fillingName = TextEditingController();
  final TextEditingController _fillingEmail = TextEditingController();
  final TextEditingController _fillingPhone = TextEditingController();
  final TextEditingController _fillingAddress = TextEditingController();
  final TextEditingController _fillingAccreditation = TextEditingController();

  GlobalKey<FormState> _ngoKey = GlobalKey<FormState>();
  bool showSpinner = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fillingName.dispose();
    _fillingEmail.dispose();
    _fillingPhone.dispose();
    _fillingAddress.dispose();
    _fillingAccreditation.dispose();

    _secNameController.dispose();
    _secEmailController.dispose();
    _secAddressController.dispose();
    _secCityController.dispose();
    _secPhoneController.dispose();
    _secAccreditationController.dispose();
    _secObjectController.dispose();
    _secOtherNameController.dispose();

    _alternativeNameCont.dispose();
    _preferredNameCont.dispose();
    _cityContr.dispose();
    _emailContr.dispose();
    _regOfficeAddressContr.dispose();
    _organisationController.dispose();
    _availabityCodeController.dispose();
    _regOfficeAddressController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _objectController.dispose();
    _constitutionController.dispose();

    _trusteeNameController.dispose();
    _trusteeNameController2.dispose();
    _trusteeNameController3.dispose();
    _trusteeNameController4.dispose();

    _trusteeEmailController.dispose();
    _trusteeEmailController2.dispose();
    _trusteeEmailController3.dispose();
    _trusteeEmailController4.dispose();

    _trusteePhoneController.dispose();
    _trusteePhoneController2.dispose();
    _trusteePhoneController3.dispose();
    _trusteePhoneController4.dispose();

    _trusteeAddressController.dispose();
    _trusteeAddressController2.dispose();
    _trusteeAddressController3.dispose();
    _trusteeAddressController4.dispose();

    _trusteeCityController.dispose();
    _trusteeCityController2.dispose();
    _trusteeCityController3.dispose();
    _trusteeCityController4.dispose();

    _trusteeDateController.dispose();
    _trusteeDateController2.dispose();
    _trusteeDateController3.dispose();
    _trusteeDateController4.dispose();

    _trusteeIdentityNumberController.dispose();
    _trusteeIdentityNumberController2.dispose();
    _trusteeIdentityNumberController3.dispose();
    _trusteeIdentityNumberController4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('New NGO Registration'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _ngoKey,
            child: Column(
              children: <Widget>[
//
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: OutlineDropdownButtonFormField(
                    items: getList(avaliabilityCodeList),
                    hint: Text('Do you have availability code?'),
                    value: answer,
                    onChanged: (_value) {
                      setState(() {
                        answer = _value;
                        answerindex = avaliabilityCodeList.indexOf(answer) + 1;
                      });
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 450),
                  child: FAStepper(
                      steps: ngoStep(),
                      currentStep: _currentStep,
                      type: FAStepperType.horizontal,
                      onStepTapped: (step) => goto(step),
                      onStepCancel: cancel,
                      onStepContinue: _currentStep + 1 != ngoStep().length ? next : submit,
                      physics: ClampingScrollPhysics(),
                      controlsBuilder: (BuildContext context,
                          {VoidCallback onStepContinue,
                          VoidCallback onStepCancel}) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  title: _currentStep + 1 != ngoStep().length
                                      ? 'Next'
                                      : 'Submit',
                                  colour: Theme.of(context).primaryColor,
                                  onPressed: onStepContinue,
                                ),
                              ),
                            ]);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  next() {
    goto(_currentStep + 1);
  }

  submit() async {
    if (_ngoKey.currentState.validate()) {
      if (answerindex == 1) {
        setState(() {
          showSpinner = true;
        });
        await postNgoWithCode();
        Navigator.pushNamed(context, PaymentPage.id);
        setState(() {
          showSpinner = false;
        });
      } else {
        setState(() {
          showSpinner = true;
        });
        await postNgoWithoutCode();
        Navigator.pushNamed(context, PaymentPage.id);
        setState(() {
          showSpinner = false;
        });
      }
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

  List<FAStep> ngoStep() {
    List<FAStep> step = [
      FAStep(
        isActive: _currentStep < 0 ? false : true,
        title: Text('Organization Details'),
        content: answerindex == 2 ? noToCode() : yesToAvailabilityCode(),
      ),
      FAStep(
        isActive: _currentStep < 1 ? false : true,
        title: Text('Organization Trustees'),
        content: Column(
          children: <Widget>[
            Text(
              'Organization Trustee',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            Divider(
              height: 5.0,
              color: Color(0xff173366),
              thickness: 3.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '(1)',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _trusteeNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: _trusteeEmailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: _trusteePhoneController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              maxLine: 2,
              textEditingController: _trusteeAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getStatesList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List statesList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(statesList),
                    value: trusteeState1,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeState1 = _value;
                        trusteeState1Id = statesList.indexOf(trusteeState1) + 1;
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
            MyCustomTextForm(
              hintText: 'City',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _trusteeCityController,
            ),
            SizedBox(
              height: 10.0,
            ),
            OutlineDropdownButtonFormField(
              items: getList(genderList),
              value: tGender1,
              hint: Text(
                'Gender',
              ),
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  tGender1 = _value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getNationalityList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List nationalityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(nationalityList),
                    value: trusteeNationality1,
                    hint: Text(
                      'Nationality',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeNationality1 = _value;
                        trusteeNationality1Id =
                            nationalityList.indexOf(trusteeNationality1) + 1;
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
            MyCustomTextForm(
              hintText: 'Date of Birth',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.datetime,
              textEditingController: _trusteeDateController,
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
              future: networking.getOccupationsList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List occupationList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(occupationList),
                    value: trusteeOccupation1,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeOccupation1 = _value;
                        trusteeOccupation1Id =
                            occupationList.indexOf(trusteeOccupation1) + 1;
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
            FutureBuilder(
              future: networking.getIdentityTypeList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List identityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(identityList),
                    value: trusteeIdentityType1,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeIdentityType1 = _value;
                        trusteeIdentityType1Id =
                            identityList.indexOf(trusteeIdentityType1) + 1;
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
            MyCustomTextForm(
              hintText: 'Identity Number',
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: _trusteeIdentityNumberController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '(2)',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _trusteeNameController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: _trusteeEmailController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: _trusteePhoneController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              maxLine: 2,
              textEditingController: _trusteeAddressController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getStatesList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List statesList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(statesList),
                    value: trusteeState2,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeState2 = _value;
                        trusteeState2Id = statesList.indexOf(trusteeState2) + 1;
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
            MyCustomTextForm(
              hintText: 'City',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _trusteeCityController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            OutlineDropdownButtonFormField(
              items: getList(genderList),
              value: tGender2,
              hint: Text(
                'Gender',
              ),
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  tGender2 = _value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getNationalityList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List nationalityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(nationalityList),
                    value: trusteeNationality2,
                    hint: Text(
                      'Nationality',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeNationality2 = _value;
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
            MyCustomTextForm(
              hintText: 'Date of Birth',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.datetime,
              textEditingController: _trusteeDateController2,
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
              future: networking.getOccupationsList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List occupationList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(occupationList),
                    value: trusteeOccupation2,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeOccupation2 = _value;
                        trusteeOccupation2Id =
                            occupationList.indexOf(trusteeOccupation2) + 1;
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
            FutureBuilder(
              future: networking.getIdentityTypeList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List identityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(identityList),
                    value: trusteeIdentityType2,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeIdentityType2 = _value;
                        trusteeIdentityType2Id =
                            identityList.indexOf(trusteeIdentityType2) + 1;
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
            MyCustomTextForm(
              hintText: 'Identity Number',
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: _trusteeIdentityNumberController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '(3)',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _trusteeNameController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: _trusteeEmailController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: _trusteePhoneController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              maxLine: 2,
              textEditingController: _trusteeAddressController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getStatesList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List statesList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(statesList),
                    value: trusteeState3,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeState3 = _value;
                        trusteeState3Id = statesList.indexOf(trusteeState3) + 1;
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
            MyCustomTextForm(
              hintText: 'City',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _trusteeCityController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            OutlineDropdownButtonFormField(
              items: getList(genderList),
              value: tGender3,
              hint: Text(
                'Gender',
              ),
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  tGender3 = _value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getNationalityList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List nationalityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(nationalityList),
                    value: trusteeNationality3,
                    hint: Text(
                      'Nationality',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeNationality3 = _value;
                        trusteeNationality3Id =
                            nationalityList.indexOf(trusteeNationality3) + 1;
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
            MyCustomTextForm(
              hintText: 'Date of Birth',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.datetime,
              textEditingController: _trusteeDateController3,
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
              future: networking.getOccupationsList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List occupationList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(occupationList),
                    value: trusteeOccupation3,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeOccupation3 = _value;
                        trusteeOccupation3Id =
                            occupationList.indexOf(trusteeOccupation3) + 1;
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
            FutureBuilder(
              future: networking.getIdentityTypeList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List identityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(identityList),
                    value: trusteeIdentityType3,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeIdentityType3 = _value;
                        trusteeIdentityType3Id =
                            identityList.indexOf(trusteeIdentityType3) + 1;
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
            MyCustomTextForm(
              hintText: 'Identity Number',
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: _trusteeIdentityNumberController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '(4)',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _trusteeNameController4,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: _trusteeEmailController4,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: _trusteePhoneController4,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              maxLine: 2,
              textEditingController: _trusteeAddressController4,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getStatesList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List statesList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(statesList),
                    value: trusteeState4,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeState4 = _value;
                        trusteeIdentityType4Id =
                            statesList.indexOf(trusteeState4) + 1;
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
            MyCustomTextForm(
              hintText: 'City',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _trusteeCityController4,
            ),
            SizedBox(
              height: 10.0,
            ),
            OutlineDropdownButtonFormField(
              items: getList(genderList),
              value: tGender4,
              hint: Text(
                'Gender',
              ),
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  tGender4 = _value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getNationalityList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List nationalityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(nationalityList),
                    value: trusteeNationality4,
                    hint: Text(
                      'Nationality',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeNationality4 = _value;
                        trusteeNationality4Id =
                            nationalityList.indexOf(trusteeState4) + 1;
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
            MyCustomTextForm(
              hintText: 'Date of Birth',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.datetime,
              textEditingController: _trusteeDateController4,
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
              future: networking.getOccupationsList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List occupationList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(occupationList),
                    value: trusteeOccupation1,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeOccupation4 = _value;
                        trusteeOccupation4Id =
                            occupationList.indexOf(trusteeOccupation4) + 1;
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
            FutureBuilder(
              future: networking.getIdentityTypeList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List identityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(identityList),
                    value: trusteeIdentityType4,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        trusteeIdentityType4 = _value;
                        trusteeIdentityType4Id =
                            identityList.indexOf(trusteeIdentityType4) + 1;
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
            MyCustomTextForm(
              hintText: 'Identity Number',
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: _trusteeIdentityNumberController4,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 2 ? false : true,
        title: Text('Secretary'),
        content: Column(
          children: <Widget>[
            Text(
              'Particulars of Secretary',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            Divider(
              height: 5.0,
              color: Color(0xff173366),
              thickness: 3.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Object',
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              isPassword: false,
              textEditingController: _secObjectController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _secNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Other Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _secOtherNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: _secEmailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: _secPhoneController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _secAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getStatesList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List statesList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(statesList),
                    value: secState,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        secState = _value;
                        secStateId = statesList.indexOf(secState) + 1;
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
            MyCustomTextForm(
              hintText: 'City',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _secCityController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Accreditation(if any)',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _secAccreditationController,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 3 ? false : true,
        title: Text('Filing'),
        content: Column(
          children: <Widget>[
            Text(
              'Presented for filing by:',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            Divider(
              height: 5.0,
              color: Color(0xff173366),
              thickness: 3.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _fillingName,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: _fillingEmail,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: _fillingPhone,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _fillingAddress,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Accreditation(if any)',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _fillingAccreditation,
            ),
          ],
        ),
      ),
    ];
    return step;
  }

  Column yesToAvailabilityCode() {
    return Column(
      children: <Widget>[
        Text(
          'Details of Organization',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 17),
        ),
        Divider(
          height: 5.0,
          color: Color(0xff173366),
          thickness: 3.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Name of Organization',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _organisationController,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Availiability Code',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _availabityCodeController,
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Organization Address',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 17),
        ),
        Divider(
          height: 5.0,
          color: Color(0xff173366),
          thickness: 3.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Registred Office Address',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _regOfficeAddressController,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Email Address',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textInputType: TextInputType.emailAddress,
          textEditingController: _emailController,
        ),
        SizedBox(
          height: 10.0,
        ),
        FutureBuilder(
          future: networking.getStatesList(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List statesList = snap.data;
              return OutlineDropdownButtonFormField(
                items: getList(statesList),
                value: ngoState1,
                hint: Text(
                  'State',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    ngoState1 = _value;
                    ngoState1Id = statesList.indexOf(ngoState1) + 1;
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
        MyCustomTextForm(
          hintText: 'City',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _cityController,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Object of Organization',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 17),
        ),
        Divider(
          height: 5.0,
          color: Color(0xff173366),
          thickness: 3.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Object',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _objectController,
          maxLine: 3,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Constitution of Organization',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 17),
        ),
        Divider(
          height: 5.0,
          color: Color(0xff173366),
          thickness: 3.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Constitution',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          maxLine: 3,
          textEditingController: _constitutionController,
        ),
      ],
    );
  }

  Column noToCode() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Proposed Name',
          textAlign: TextAlign.start,
        ),
        Divider(
          height: 5.0,
          color: Color(0xff173366),
          thickness: 3.0,
        ),
        FutureBuilder(
          future: networking.getClassificationsList(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List classObject = snap.data;
              List classifiList =
                  classification.getClassificationData(classObject);
              return OutlineDropdownButtonFormField(
                  items: getList(classifiList),
                  hint: Text('select classification'),
                  value: selectedClassification,
                  decoration: dropDownDecoration,
                  onChanged: (_value) {
                    setState(() {
                      selectedClassification = _value;
                      checkersInt =
                          classifiList.indexOf(selectedClassification) + 1;
                      check = true;
                      print(checkersInt);
                    });
                  });
            } else {
              return OutlineDropdownButtonFormField(
                items: getList(['loading...']),
                decoration: dropDownDecoration,
              );
            }
          },
        ),
        SizedBox(
          height: 30.0,
        ),
        FutureBuilder(
          future: networking.getClassificationsList(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List classificationData = snap.data;
              List<String> specificDataList =
                  classification.getSpecificTypeData(classificationData);
              print(specificDataList);
              List businessNameList = specificDataList.sublist(0, 1);
              List companyList = specificDataList.sublist(1, 7);
              List incorporationTrusteeList = specificDataList.sublist(7, 9);

              List<DropdownMenuItem<String>> getSpecificList(checkersInt) {
                List<DropdownMenuItem<String>> specificList;
                if (checkersInt == 1) {
                  specificList = getList(businessNameList);
                } else if (checkersInt == 2) {
                  specificList = getList(companyList);
                } else if (checkersInt == 3) {
                  specificList = getList(incorporationTrusteeList);
                } else {
                  specificList = getList(['Loading']);
                }
                return specificList;
              }

              return OutlineDropdownButtonFormField(
                  items: check ? getSpecificList(checkersInt) : null,
                  hint: Text('select specific type'),
                  value: specificTypeSelect,
                  decoration: dropDownDecoration,
                  validator: (_value) {
                    if (_value.isEmpty) {
                      return 'Please select specific type';
                    } else {
                      return null;
                    }
                  },
                  disabledHint: Text('Select classification above'),
                  onChanged: (_value) {
                    setState(() {
                      specificTypeSelect = _value;
                      specificTypeId =
                          specificDataList.indexOf(specificTypeSelect) + 1;
                      print('specific value = $specificTypeSelect');
                    });
                  });
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
        Text('Name should end with ltd or limited.'),
        MyCustomTextForm(
          hintText: 'Preferred Name',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _preferredNameCont,
          validator: (_value) {
            if (_value.isEmpty) {
              return 'This field cannot be empty.';
            } else {
              return null;
            }
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Alternative Name',
          isPassword: false,
          textEditingController: _alternativeNameCont,
          validator: (_value) {
            if (_value.isEmpty) {
              return 'This field cannot be empty.';
            } else {
              return null;
            }
          },
          outlineInputBorder: OutlineInputBorder(),
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Registered Office Address',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _regOfficeAddressContr,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Email',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _emailContr,
        ),
        SizedBox(
          height: 10.0,
        ),
        FutureBuilder(
          future: networking.getStatesList(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List statesList = snap.data;
              return OutlineDropdownButtonFormField(
                items: getList(statesList),
                value: noState1,
                hint: Text(
                  'State',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    noState1 = _value;
                    noState1Id = statesList.indexOf(noState1) + 1;
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
        MyCustomTextForm(
          hintText: 'City',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _cityContr,
        ),
      ],
    );
  }

  Future<void> postNgoWithCode() async {
    String url = 'https://klasskorporate.com/api/trustees';
    Map<String, dynamic> map = {
      "question": answer,
      "organization_name": _organisationController.text,
      "availability_code": _availabityCodeController.text,
      "registered_office_address": _regOfficeAddressController.text,
      "email": _emailController.text,
      "state_id": ngoState1Id,
      "city": _cityController.text,
      "trustees_name": [
        _trusteeNameController.text,
        _trusteeNameController2.text,
        _trusteeNameController3.text,
        _trusteeNameController4.text
      ],
      "trustees_address": [
        _trusteeAddressController.text,
        _trusteeAddressController2.text,
        _trusteeAddressController3.text,
        _trusteeAddressController4.text
      ],
      "trustees_email": [
        _trusteeEmailController.text,
        _trusteeEmailController2.text,
        _trusteeEmailController3.text,
        _trusteeEmailController4.text
      ],
      "trustees_phone_number": [
        _trusteePhoneController.text,
        _trusteePhoneController2.text,
        _trusteePhoneController3.text,
        _trusteePhoneController4.text
      ],
      "trustees_city": [
        _trusteeCityController.text,
        _trusteeCityController2.text,
        _trusteeCityController3.text,
        _trusteeCityController4.text
      ],
      "trustees_state_id": [
        trusteeState1Id,
        trusteeState2Id,
        trusteeState3Id,
        trusteeState4Id
      ],
      "trustees_gender": [tGender1, tGender2, tGender3, tGender4],
      "trustees_nationality_id": [
        trusteeNationality1Id,
        trusteeNationality2Id,
        trusteeNationality3Id,
        trusteeNationality4Id
      ],
      "trustees_dob": [
        _trusteeDateController.text,
        _trusteeDateController2.text,
        _trusteeDateController3.text,
        _trusteeDateController4.text,
      ],
      "trustees_occupation": [
        trusteeOccupation1Id,
        trusteeOccupation2Id,
        trusteeOccupation3Id,
        trusteeOccupation4Id
      ],
      "trustees_identity_type_id": [
        trusteeIdentityType1Id,
        trusteeIdentityType2Id,
        trusteeIdentityType3Id,
        trusteeIdentityType4Id
      ],
      "trustees_identity_type_number": [
        _trusteeIdentityNumberController.text,
        _trusteeIdentityNumberController2.text,
        _trusteeIdentityNumberController3.text,
        _trusteeIdentityNumberController4.text
      ],
      "objects": _secObjectController.text,
      "secretary_first_name": _secNameController.text,
      "secretary_other_names": _secOtherNameController.text,
      "secretary_address": _secAddressController.text,
      "secretary_city": _secCityController.text,
      "secretary_state_id": secStateId,
      "secretary_email": _secEmailController.text,
      "filing_name": _fillingName.text,
      "filing_address": _fillingAddress.text,
      "filing_phone_number": _fillingPhone.text,
      "filing_email": _fillingEmail.text,
      "filing_accreditation_number": _fillingAccreditation.text
    };
    await networking.postOther(urls: url, map: map);
  }

  Future<void> postNgoWithoutCode() async {
    String url = 'https://klasskorporate.com/api/trustees';
    Map<String, dynamic> map = {
      "question": answer,
      "specific_type_id": specificTypeId,
      "names": [_preferredNameCont.text, _alternativeNameCont.text],
      "registered_office_address": _regOfficeAddressContr.text,
      "email": _emailContr.text,
      "state_id": noState1Id,
      "city": _cityContr.text,
      "trustees_name": [
        _trusteeNameController.text,
        _trusteeNameController2.text,
        _trusteeNameController3.text,
        _trusteeNameController4.text
      ],
      "trustees_address": [
        _trusteeAddressController.text,
        _trusteeAddressController2.text,
        _trusteeAddressController3.text,
        _trusteeAddressController4.text
      ],
      "trustees_email": [
        _trusteeEmailController.text,
        _trusteeEmailController2.text,
        _trusteeEmailController3.text,
        _trusteeEmailController4.text
      ],
      "trustees_phone_number": [
        _trusteePhoneController.text,
        _trusteePhoneController2.text,
        _trusteePhoneController3.text,
        _trusteePhoneController4.text
      ],
      "trustees_city": [
        _trusteeCityController.text,
        _trusteeCityController2.text,
        _trusteeCityController3.text,
        _trusteeCityController4.text
      ],
      "trustees_state_id": [
        trusteeState1Id,
        trusteeState2Id,
        trusteeState3Id,
        trusteeState4Id
      ],
      "trustees_gender": [tGender1, tGender2, tGender3, tGender4],
      "trustees_nationality_id": [
        trusteeNationality1Id,
        trusteeNationality2Id,
        trusteeNationality3Id,
        trusteeNationality4Id
      ],
      "trustees_dob": [
        _trusteeDateController.text,
        _trusteeDateController2.text,
        _trusteeDateController3.text,
        _trusteeDateController4.text,
      ],
      "trustees_occupation": [
        trusteeOccupation1Id,
        trusteeOccupation2Id,
        trusteeOccupation3Id,
        trusteeOccupation4Id
      ],
      "trustees_identity_type_id": [
        trusteeIdentityType1Id,
        trusteeIdentityType2Id,
        trusteeIdentityType3Id,
        trusteeIdentityType4Id
      ],
      "trustees_identity_type_number": [
        _trusteeIdentityNumberController.text,
        _trusteeIdentityNumberController2.text,
        _trusteeIdentityNumberController3.text,
        _trusteeIdentityNumberController4.text
      ],
      "objects": _secObjectController.text,
      "secretary_first_name": _secNameController.text,
      "secretary_other_names": _secOtherNameController.text,
      "secretary_address": _secAddressController.text,
      "secretary_city": _secCityController.text,
      "secretary_state_id": secStateId,
      "secretary_email": _secEmailController.text,
      "filing_name": _fillingName.text,
      "filing_address": _fillingAddress.text,
      "filing_phone_number": _fillingPhone.text,
      "filing_email": _fillingEmail.text,
      "filing_accreditation_number": _fillingAccreditation.text
    };
    await networking.postOther(urls: url, map: map);
  }
}

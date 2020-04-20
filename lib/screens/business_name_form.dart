import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:klass_korporate/model/dropdown_datas.dart';
import 'package:klass_korporate/screens/payment.dart';
import 'package:klass_korporate/screens/widgets/roundButton.dart';
import 'package:klass_korporate/screens/widgets/textformfield.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class BusinessNameForm extends StatefulWidget {
  static const String id = 'business_name_form';

  @override
  _BusinessNameFormState createState() => _BusinessNameFormState();
}

class _BusinessNameFormState extends State<BusinessNameForm> {
  Networking networking = Networking();
  bool showSpinner = false;
  int _currentStep = 0;
  bool complete = false;
  String selectedState1;
  String selectedState2;
  String selectedState3;
  int answerIndex;
  int pStateId1;
  int pStateId2;
  int pStateId3;
  int reasonForSearchId;
  int natureOfBusinessId;
  String answer;
  bool disableDropDown = true;
  bool haveNameReservationCode = true;
  bool yes = false;
  bool no = false;
  String stateSelected;
  String genderSelected;
  String nationalitySelected;
  String countrySelected;
  String modeOfIdentitySelected;
  String reasonForAvailabilitySelected;
  String natureOfBusinessSelected;
  int selectedNationalityId;
  int selectedCountryId;
  int selectedStateId;
  int identityTypeId;

  final GlobalKey<FormState> _businessFormKey = GlobalKey<FormState>();

  List<String> questionList = ['Yes', 'No'];
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _availabilityCodeController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _natureOfBusinessController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _branchAddressController = TextEditingController();
  final TextEditingController pSurnameController1 = TextEditingController();
  final TextEditingController pSurnameController2 = TextEditingController();
  final TextEditingController pSurnameController3 = TextEditingController();
  final TextEditingController pOtherNamesController1 = TextEditingController();
  final TextEditingController pOtherNamesController2 = TextEditingController();
  final TextEditingController pOtherNamesController3 = TextEditingController();
  final TextEditingController pAddressController1 = TextEditingController();
  final TextEditingController pAddressController2 = TextEditingController();
  final TextEditingController pAddressController3 = TextEditingController();
  final TextEditingController pCityController1 = TextEditingController();
  final TextEditingController pCityController2 = TextEditingController();
  final TextEditingController pCityController3 = TextEditingController();
  final TextEditingController pEmailController1 = TextEditingController();
  final TextEditingController pEmailController2 = TextEditingController();
  final TextEditingController pEmailController3 = TextEditingController();
  final TextEditingController pPhoneNumberController1 = TextEditingController();
  final TextEditingController pPhoneNumberController2 = TextEditingController();
  final TextEditingController pPhoneNumberController3 = TextEditingController();
  final TextEditingController pDateOfBirthController1 = TextEditingController();
  final TextEditingController pDateOfBirthController2 = TextEditingController();
  final TextEditingController pDateOfBirthController3 = TextEditingController();
  final TextEditingController _fillingNameController = TextEditingController();
  final TextEditingController _fillingAddressController =
      TextEditingController();
  final TextEditingController _fillingEmailController = TextEditingController();
  final TextEditingController _fillingPhoneNumController =
      TextEditingController();
  final TextEditingController _fillingAccreditationNumController =
      TextEditingController();
  final TextEditingController _dateOfComercementController =
      TextEditingController();
  final TextEditingController _preferredNameCont = TextEditingController();
  final TextEditingController _alternativeNameCont = TextEditingController();
  final TextEditingController _dobCont = TextEditingController();
  final TextEditingController _noAddressContr = TextEditingController();
  final TextEditingController _nobCityContr = TextEditingController();
  final TextEditingController _identityTypeContr = TextEditingController();
  final TextEditingController _natOfBizContr = TextEditingController();
  final TextEditingController _addressOfBizContr = TextEditingController();
  final TextEditingController _branchAddressOfBizContr =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _natOfBizContr.dispose();
    _addressOfBizContr.dispose();
    _branchAddressOfBizContr.dispose();
    _preferredNameCont.dispose();
    _alternativeNameCont.dispose();
    _questionController.dispose();
    _availabilityCodeController.dispose();
    _nameController.dispose();
    _natureOfBusinessController.dispose();
    _addressController.dispose();
    _branchAddressController.dispose();
    pSurnameController1.dispose();
    pSurnameController2.dispose();
    pSurnameController3.dispose();
    pOtherNamesController1.dispose();
    pOtherNamesController2.dispose();
    pOtherNamesController3.dispose();
    pAddressController1.dispose();
    pAddressController2.dispose();
    pAddressController3.dispose();
    pCityController1.dispose();
    pCityController2.dispose();
    pCityController3.dispose();
    pEmailController1.dispose();
    pEmailController2.dispose();
    pEmailController3.dispose();
    pPhoneNumberController1.dispose();
    pPhoneNumberController2.dispose();
    pPhoneNumberController3.dispose();
    pDateOfBirthController1.dispose();
    pDateOfBirthController2.dispose();
    pDateOfBirthController3.dispose();
    _fillingNameController.dispose();
    _fillingAddressController.dispose();
    _fillingAccreditationNumController.dispose();
    _fillingEmailController.dispose();
    _fillingPhoneNumController.dispose();
    _dateOfComercementController.dispose();
    _dobCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Business Name'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _businessFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: OutlineDropdownButtonFormField(
                    items: getList(questionList),
                    hint: Text('Do you have availability code?'),
                    value: answer,
                    validator: (_value) {
                      if (_value.isEmpty) {
                        return 'This feild connot be empty';
                      }
                      return null;
                    },
                    onChanged: (_value) {
                      setState(() {
                        answer = _value;
                        answerIndex = questionList.indexOf(answer) + 1;
                      });
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 450, width: 600),
                  child: FAStepper(
                    titleHeight: 80,
                    titleIconArrange: FAStepperTitleIconArrange.column,
                    stepNumberColor: Color(0xffA6790D),
                    steps: businessNameStep(),
                    currentStep: _currentStep,
                    type: FAStepperType.horizontal,
                    onStepTapped: (step) => goto(step),
                    onStepCancel: cancel,
                    onStepContinue:  _currentStep + 1 != businessNameStep().length ? next: submit,
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
                              title:
                                  _currentStep + 1 != businessNameStep().length
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  next() {
    _businessFormKey.currentState.save();
    if(_businessFormKey.currentState.validate()){
      goto(_currentStep + 1);
    }
  }

  submit()async{
    _businessFormKey.currentState.save();
    complete = true;
    if (_businessFormKey.currentState
        .validate()) {
      if (answerIndex == 1) {
        setState(() {
          showSpinner = true;
        });
        await postBusinessNameWithCode();
        setState(() {
          showSpinner = false;
        });
        Navigator.pushNamed(
            context, PaymentPage.id);

      } else {
        setState(() {
          showSpinner = true;
        });
        await postBusinessNameWithoutCode();
        setState(() {
          showSpinner = false;
        });
        Navigator.pushNamed(
            context, PaymentPage.id);
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

  List<FAStep> businessNameStep() {
    List<FAStep> steps = [
      FAStep(
        isActive: _currentStep < 0 ? false : true,
        title: Text('Company Type'),
        content: answerIndex == 2 ? answerNoColumn() : answerYesColumn(),
      ),
      FAStep(
        isActive: _currentStep < 1 ? false : true,
        title: Text('Propietors'),
        content: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Particulars of Propietors(Other than corporation)',
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
              hintText: 'Surname',
              textEditingController: pSurnameController1,
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              validator: (_value) {
                if (_value.isEmpty) {
                  return 'This feild connot be empty';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Other names',
              textEditingController: pOtherNamesController1,
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Residential address',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: pAddressController1,
              validator: (_value) {
                if (_value.isEmpty) {
                  return 'This feild connot be empty';
                }
                return null;
              },
              isPassword: false,
              maxLine: 2,
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
                    value: selectedState1,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        selectedState1 = _value;
                        pStateId1 = statesList.indexOf(selectedState1) + 1;
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
              textEditingController: pCityController1,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              validator: (_value) {
                if (_value.isEmpty) {
                  return 'This feild connot be empty';
                }
                return null;
              },
              textEditingController: pEmailController1,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: pPhoneNumberController1,
              validator: (_value) {
                if (_value.isEmpty) {
                  return 'This feild connot be empty';
                }
                return null;
              },
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Date of Birth',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: pDateOfBirthController1,
              textInputType: TextInputType.datetime,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '(2)',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              hintText: 'Surname',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: pSurnameController2,
              isPassword: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Other names',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: pOtherNamesController2,
              isPassword: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Residential address',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: pAddressController2,
              isPassword: false,
              maxLine: 2,
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
                    value: selectedState2,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        selectedState2 = _value;
                        pStateId2 = statesList.indexOf(selectedState2) + 1;
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
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: pEmailController2,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: pPhoneNumberController2,
              isPassword: false,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Date of Birth',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.datetime,
              textEditingController: pDateOfBirthController2,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '(3)',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              hintText: 'Surname',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: pSurnameController3,
              isPassword: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Other names',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: pOtherNamesController3,
              isPassword: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Residential address',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: pAddressController3,
              isPassword: false,
              maxLine: 2,
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
                    value: selectedState3,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        selectedState3 = _value;
                        pStateId3 = statesList.indexOf(selectedState3) + 1;
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
              textEditingController: pCityController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: pEmailController3,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: pPhoneNumberController3,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Date of Birth',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: pDateOfBirthController3,
              isPassword: false,
              textInputType: TextInputType.datetime,
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 2 ? false : true,
        title: Text('Filing'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
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
              hintText: 'Name',
              outlineInputBorder: OutlineInputBorder(),
              validator: (_value) {
                if (_value.isEmpty) {
                  return 'This feild connot be empty';
                }
                return null;
              },
              textEditingController: _fillingNameController,
              isPassword: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Filing Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _fillingAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Accreditation Number(if applicable)',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: _fillingAccreditationNumController,
              isPassword: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              validator: (_value) {
                if (_value.isEmpty) {
                  return 'This feild connot be empty';
                }
                return null;
              },
              textEditingController: _fillingPhoneNumController,
              textInputType: TextInputType.number,
              isPassword: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              validator: (_value) {
                if (_value.isEmpty) {
                  return 'This feild connot be empty';
                }
                return null;
              },
              textEditingController: _fillingEmailController,
              textInputType: TextInputType.emailAddress,
              isPassword: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Date of commencement',
              outlineInputBorder: OutlineInputBorder(),
              textEditingController: _dateOfComercementController,
              textInputType: TextInputType.number,
              isPassword: false,
            ),
          ],
        ),
      ),
    ];
    return steps;
  }

  Column answerNoColumn() {
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
        Text(
          'Objectives',
          textAlign: TextAlign.start,
        ),
        Divider(
          height: 5.0,
          color: Color(0xff173366),
          thickness: 3.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        FutureBuilder(
          future: networking.getReasonForSearchList(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List reasonList = snap.data;
              return OutlineDropdownButtonFormField(
                items: getList(reasonList),
                value: reasonForAvailabilitySelected,
                hint: Text(
                  'Reason for availability search',
                ),
                validator: (_value) {
                  if (_value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    reasonForAvailabilitySelected = _value;
                    reasonForSearchId =
                        reasonList.indexOf(reasonForAvailabilitySelected);
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
          future: networking.getNatureOfBusinessList(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List natureList = snap.data;
              return OutlineDropdownButtonFormField(
                items: getList(natureList),
                value: natureOfBusinessSelected,
                hint: Text(
                  'Nature of Business',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    natureOfBusinessSelected = _value;
                    natureOfBusinessId =
                        natureList.indexOf(natureOfBusinessSelected) + 1;
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
          'Presenter Details',
          textAlign: TextAlign.start,
        ),
        Divider(
          height: 5.0,
          color: Color(0xff173366),
          thickness: 3.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        OutlineDropdownButtonFormField(
          items: getList(genderList),
          value: genderSelected,
          hint: Text(
            'Gender',
          ),
          decoration: dropDownDecoration,
          onChanged: (_value) {
            setState(() {
              genderSelected = _value;
            });
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Date of Birth',
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _dobCont,
          isPassword: false,
          textInputType: TextInputType.datetime,
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
                value: nationalitySelected,
                hint: Text(
                  'Nationality',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    nationalitySelected = _value;
                    selectedNationalityId =
                        nationalityList.indexOf(nationalitySelected) + 1;
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
          'Address',
          textAlign: TextAlign.start,
        ),
        Divider(
          height: 5.0,
          color: Color(0xff173366),
          thickness: 3.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        FutureBuilder(
          future: networking.getCountriesList(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List<String> countryList = snap.data;
              return OutlineDropdownButtonFormField(
                items: getList(countryList),
                value: countrySelected,
                hint: Text(
                  'Country',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    countrySelected = _value;
                    selectedCountryId =
                        countryList.indexOf(countrySelected) + 1;
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
          future: networking.getStatesList(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List statesList = snap.data;
              return OutlineDropdownButtonFormField(
                items: getList(statesList),
                value: stateSelected,
                hint: Text(
                  'State',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    stateSelected = _value;
                    selectedStateId = statesList.indexOf(stateSelected) + 1;
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
          textEditingController: _nobCityContr,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Address',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _noAddressContr,
        ),
        Text(
          'Mode of Identification',
          textAlign: TextAlign.start,
        ),
        Divider(
          height: 5.0,
          color: Color(0xff173366),
          thickness: 3.0,
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
                value: modeOfIdentitySelected,
                hint: Text(
                  'Identity Type',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    modeOfIdentitySelected = _value;
                    identityTypeId =
                        identityList.indexOf(modeOfIdentitySelected) + 1;
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
          textEditingController: _identityTypeContr,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Details of Business',
          textAlign: TextAlign.start,
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
          hintText: 'General Nature of Business',
          isPassword: false,
          textEditingController: _natOfBizContr,
          maxLine: 2,
          outlineInputBorder: OutlineInputBorder(),
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Full Address of principal place of Business',
          isPassword: false,
          textEditingController: _addressOfBizContr,
          maxLine: 2,
          outlineInputBorder: OutlineInputBorder(),
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Address of branch(if any)',
          isPassword: false,
          textEditingController: _branchAddressOfBizContr,
          maxLine: 2,
          outlineInputBorder: OutlineInputBorder(),
        ),
      ],
    );
  }

  Column answerYesColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Company Name',
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
          hintText: 'Availiability Code',
          outlineInputBorder: OutlineInputBorder(),
          validator: (_value) {
            if (_value.isEmpty) {
              return 'This feild connot be empty';
            }
            return null;
          },
          isPassword: false,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Name of business',
          outlineInputBorder: OutlineInputBorder(),
          validator: (_value) {
            if (_value.isEmpty) {
              return 'This feild connot be empty';
            }
            return null;
          },
          isPassword: false,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'General Nature of business',
          outlineInputBorder: OutlineInputBorder(),
          validator: (_value) {
            if (_value.isEmpty) {
              return 'This feild connot be empty';
            }
            return null;
          },
          isPassword: false,
          maxLine: 3,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Full address of principal place of business',
          outlineInputBorder: OutlineInputBorder(),
          validator: (_value) {
            if (_value.isEmpty) {
              return 'This feild connot be empty';
            }
            return null;
          },
          isPassword: false,
          maxLine: 3,
        ),
        SizedBox(
          height: 10.0,
        ),
        MyCustomTextForm(
          hintText: 'Full address of branch(es) (if any)',
          outlineInputBorder: OutlineInputBorder(),
          isPassword: false,
          maxLine: 3,
        ),
      ],
    );
  }

  Future<void> postBusinessNameWithCode() async {
    String url = 'https://klasskorporate.com/api/business-name-registrations';
    Map<String, dynamic> postData = {
      "question": _questionController.text,
      "availability_code": _availabilityCodeController.text,
      "name": _nameController.text,
      "nature_of_business": _natureOfBusinessController.text,
      "address": _addressController.text,
      "branch_address": _branchAddressController.text,
      "psurname": [
        pSurnameController1.text,
        pSurnameController2.text,
        pSurnameController3.text
      ],
      "pothernames": [
        pOtherNamesController1.text,
        pOtherNamesController2.text,
        pOtherNamesController3.text
      ],
      "paddress": [
        pAddressController1.text,
        pAddressController2.text,
        pAddressController3.text
      ],
      "pcity": [
        pCityController1.text,
        pCityController2.text,
        pCityController3.text
      ],
      "pstate_id": [pStateId1, pStateId2, pStateId3],
      "pemail": [
        pEmailController1.text,
        pEmailController2.text,
        pEmailController3.text
      ],
      "pphone_number": [
        pPhoneNumberController1.text,
        pPhoneNumberController2.text,
        pPhoneNumberController3.text
      ],
      "pdob": [
        pDateOfBirthController1.text,
        pDateOfBirthController2.text,
        pDateOfBirthController3.text
      ],
      "filing_name": _fillingNameController.text,
      "filing_address": _fillingAddressController.text,
      "filing_email": _fillingEmailController.text,
      "filing_phone_number": _fillingPhoneNumController.text,
      "filing_accreditation_number": _fillingAccreditationNumController.text,
      "date_of_commencement": _dateOfComercementController.text
    };
    await networking.postOther(urls: url, map: postData);
  }

  Future<void> postBusinessNameWithoutCode() async {
    String url = 'https://klasskorporate.com/api/business-name-registrations';
    Map<String, dynamic> postData = {
      "question": answer,
      "names": [_preferredNameCont.text, _alternativeNameCont.text],
      "reason_for_search": reasonForSearchId,
      "nature_of_business": natureOfBusinessId,
      "remark": "",
      "gender": genderSelected,
      "dob": _dobCont.text,
      "nationality_id": selectedCountryId,
      "country_id": selectedCountryId,
      "state_id": selectedStateId,
      "city": _nobCityContr,
      "identity_type_id": identityTypeId,
      "identity_type_number": _identityTypeContr.text,
      "nature_of_business": _natOfBizContr.text,
      "address": _addressOfBizContr.text,
      "branch_address": _branchAddressOfBizContr.text,
      "psurname": [
        pSurnameController1.text,
        pSurnameController2.text,
        pSurnameController3.text
      ],
      "pothernames": [
        pOtherNamesController1.text,
        pOtherNamesController2.text,
        pOtherNamesController3.text
      ],
      "paddress": [
        pAddressController1.text,
        pAddressController2.text,
        pAddressController3.text
      ],
      "pcity": [
        pCityController1.text,
        pCityController2.text,
        pCityController3.text
      ],
      "pstate_id": [pStateId1, pStateId2, pStateId3],
      "pemail": [
        pEmailController1.text,
        pEmailController2.text,
        pEmailController3.text
      ],
      "pphone_number": [
        pPhoneNumberController1.text,
        pPhoneNumberController2.text,
        pPhoneNumberController3.text
      ],
      "pdob": [
        pDateOfBirthController1.text,
        pDateOfBirthController2.text,
        pDateOfBirthController3.text
      ],
      "filing_name": _fillingNameController.text,
      "filing_address": _fillingAddressController.text,
      "filing_email": _fillingEmailController.text,
      "filing_phone_number": _fillingPhoneNumController.text,
      "filing_accreditation_number": _fillingAccreditationNumController.text,
      "date_of_commencement": _dateOfComercementController.text
    };
    await networking.postOther(urls: url,map: postData);
  }
}

import 'package:flutter/material.dart';
import 'package:klass_korporate/model/classification_model.dart';
import 'package:klass_korporate/screens/payment.dart';
import 'package:klass_korporate/screens/widgets/roundButton.dart';
import 'package:klass_korporate/screens/widgets/textformfield.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:klass_korporate/model/dropdown_datas.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class NameReserveForm extends StatefulWidget {
  static const String id = 'name_reserve_form';

  @override
  _NameReserveFormState createState() => _NameReserveFormState();
}

class _NameReserveFormState extends State<NameReserveForm> {
  final GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();
  Networking networking = Networking();
  Classification classification = Classification();
  InputDecoration dropDownDecoration = InputDecoration(
      contentPadding: EdgeInsets.all(4), border: OutlineInputBorder());
  int _currentStep = 0;
  bool complete = false;
  int classSelected;
  int specificTypeId;
  int reasonForSearchId;
  int natureOfBusinessId;
  String specificTypeSelect;
  String specificTypeSelected;
  String _reasonForAvailabilitySelected;
  String _natureOfBusinessSelected;
  String genderSelected;
  String _nationalitySelected;
  String _countrySelected;
  String _stateSelected;
  String _modeOfIdentitySelected;
  String selectedClass;
  String selectedClassification;
  List<DropdownMenuItem<String>> specificTypeList = List();

  final TextEditingController _preferredNameCont = TextEditingController();
  final TextEditingController _alternativeNameCont = TextEditingController();

  next() {
    if (_nameFormKey.currentState.validate()) {
      goto(_currentStep + 1);
    }
  }
submit()async{
  if (_nameFormKey.currentState.validate()) {
    _nameFormKey.currentState.save();
    showSpinner = true;
    try {
      await postNameReservatioin();
      Navigator.pushNamed(
          context, PaymentPage.id);
      showSpinner = false;
    }catch(e){
      print(e);
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

  int checkersInt;
  bool check = false;
  bool businessNamechecker = false;
  bool companyChecker = false;
  bool incoporateTrusteeChecker = false;
  List<FAStep> steps;
  bool showSpinner = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networking.getClassificationsList();
    networking.getCountriesList();
    networking.getStatesList();
    networking.getReasonForSearchList();
    networking.getNatureOfBusinessList();
    networking.getIdentityTypeList();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Name Reservation'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _nameFormKey,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 600.0),
              child: FAStepper(
                titleHeight: 80,
                stepNumberColor: Theme.of(context).primaryColor,
                titleIconArrange: FAStepperTitleIconArrange.column,
                steps: nameReservationStep(),
                currentStep: _currentStep,
                type: FAStepperType.horizontal,
                onStepTapped: (step) => goto(step),
                onStepCancel: cancel,
                onStepContinue:  _currentStep + 1 != nameReservationStep().length?next:submit(),
                physics: ClampingScrollPhysics(),
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
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
                                _currentStep + 1 != nameReservationStep().length
                                    ? 'Next'
                                    : 'Submit',
                            colour: Theme.of(context).primaryColor,
                            onPressed: onStepContinue
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

  List<FAStep> nameReservationStep() {
    steps = [
      FAStep(
        isActive: _currentStep < 0 ? false : true,
        title: Text('Company Type'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Company Name',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 19),
            ),
            Divider(
              height: 5.0,
              color: Color(0xff173366),
              thickness: 1.5,
            ),
            SizedBox(
              height: 20.0,
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
                          checkersInt = 0;
                          selectedClassification = _value;
                          checkersInt =
                              classifiList.indexOf(selectedClassification) + 1;
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
                  List incorporationTrusteeList =
                      specificDataList.sublist(7, 9);

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
                      items: checkersInt != 0 ? getSpecificList(checkersInt) : null,
                      hint: Text('select specific type'),
                      value: specificTypeSelect,
                      decoration: dropDownDecoration,
                      disabledHint: Text('Select classification above'),
                      onChanged: (_value) {
                        setState(() {
                          specificTypeSelect = _value;
                          specificTypeId =
                              specificDataList.indexOf(specificTypeSelect) + 1;
                          print('specific Id = $specificTypeId');
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
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 1 ? false : true,
        title: Text('Proposed Name'),
        content: Column(
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
            )
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 2 ? false : true,
        title: Text('Ojective'),
        content: Column(
          children: <Widget>[
            Text(
              'Objective',
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
              builder: (BuildContext context, AsyncSnapshot snapR) {
                if (snapR.hasData) {
                  List reasonList = snapR.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(reasonList),
                    value: _reasonForAvailabilitySelected,
                    hint: Text(
                      'Reason for availability search',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value1) {
                      setState(() {
                        _reasonForAvailabilitySelected = _value1;
                        reasonForSearchId =
                            reasonList.indexOf(_reasonForAvailabilitySelected);
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
                  List natureListName = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(natureListName),
                    value: _natureOfBusinessSelected,
                    hint: Text(
                      'Nature of Business',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value2) {
                      setState(() {
                        _natureOfBusinessSelected = _value2;
                        natureOfBusinessId =
                            natureListName.indexOf(_natureOfBusinessSelected) + 1;
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
              hintText: 'Additional comment',
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 3 ? false : true,
        title: Text('Presenter Details'),
        content: Column(
          children: <Widget>[
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
              isPassword: false,
              textInputType: TextInputType.datetime,
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: networking.getNationalityList(),
              builder: (BuildContext context, AsyncSnapshot snapNa) {
                if (snapNa.hasData) {
                  List nationalityListName = snapNa.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(nationalityListName),
                    value: _nationalitySelected,
                    hint: Text(
                      'Nationality',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        _nationalitySelected = _value;
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
                  List<String> countryListName = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(countryListName),
                    value: _countrySelected,
                    hint: Text(
                      'Country',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        _countrySelected = _value;
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
                    value: _stateSelected,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        _stateSelected = _value;
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
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
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
                    value: _modeOfIdentitySelected,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        _modeOfIdentitySelected = _value;
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
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    ];
    return steps;
  }

  Future<void> postNameReservatioin() async {
    String preffName = _preferredNameCont.text;
    String altName = _alternativeNameCont.text;
    String nameReservationUrl = 'https://klasskorporate.com/api/reservations';

    Map<String, dynamic> postNameReservation = {
      "specific_type_id": specificTypeId,
      "consent_code": null,
      "names": [preffName, altName],
      "reason_for_search_id": reasonForSearchId,
      "remark": null,
      "nature_of_business_id": natureOfBusinessId
    };
    await networking.postOther(
        urls: nameReservationUrl, map: postNameReservation);
  }
}

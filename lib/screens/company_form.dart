import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:klass_korporate/model/dropdown_datas.dart';
import 'package:klass_korporate/screens/widgets/roundButton.dart';
import 'package:klass_korporate/screens/widgets/textformfield.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:klass_korporate/screens/payment.dart';
import 'package:klass_korporate/model/classification_model.dart';

class CompanyForm extends StatefulWidget {
  static const String id = 'company_form';

  @override
  _CompanyFormState createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  Networking networking = Networking();
  Classification classification = Classification();
  int answerindex;
  String answer;
  bool check;
  int checkersInt;
  String specificTypeSelect;
  String selectedClassification;
  int specificTypeId;
  int _currentStep = 0;
  int identityTypeId;
  int reasonForSearchId;
  int natureOfBusinessId;
  int selectedNationalityId;
  int selectedStateId;
  int selectedCountryId;
  bool complete = false;
  String selectedGender;
  String selectedNationality;
  String selectedState;
  String selectedCountry;
  String selectedIdentityType;
  String genderSelected;
  String reasonForAvailabilitySelected;
  String natureOfBusinessSelected;
  String stateSelected;
  String countrySelected;
  String modeOfIdentitySelected;
  String nationalitySelected;
  String selectedCompanyState;
  int selectedCompanyStateId;
  String dSelectedState1;
  String dSelectedState2;
  String dSelectedState3;
  String dSelectedState4;
  int dSelectedStateId1;
  int dSelectedStateId2;
  int dSelectedStateId3;
  int dSelectedStateId4;
  String dSelectedCountry1;
  String dSelectedCountry2;
  String dSelectedCountry3;
  String dSelectedCountry4;
  int dSelectedCountryId1;
  int dSelectedCountryId2;
  int dSelectedCountryId3;
  int dSelectedCountryId4;
  String dSelectedNationality1;
  String dSelectedNationality2;
  String dSelectedNationality3;
  String dSelectedNationality4;
  int dSelectedNationalityId1;
  int dSelectedNationalityId2;
  int dSelectedNationalityId3;
  int dSelectedNationalityId4;
  String dSelectedIdentityType1;
  String dSelectedIdentityType2;
  String dSelectedIdentityType3;
  String dSelectedIdentityType4;
  int dSelectedIdentityTypeId1;
  int dSelectedIdentityTypeId2;
  int dSelectedIdentityTypeId3;
  int dSelectedIdentityTypeId4;
  String secSelectedIdentityType;
  int secSelectedIdentityTypeId;
  String sh1SelectedIdentityType;
  String sh2SelectedIdentityType;
  int sh1SelectedIdentityTypeId;
  int sh2SelectedIdentityTypeId;
  String dSelectedGender1;
  String dSelectedGender2;
  String dSelectedGender3;
  String dSelectedGender4;

  bool disableDropDown = true;
  bool haveNameReservationCode = true;
  bool yes = false;
  bool no = false;
  bool showSpinner = false;

  final TextEditingController _preferredNameCont = TextEditingController();
  final TextEditingController _alternativeNameCont = TextEditingController();
  final TextEditingController _dobCont = TextEditingController();
  final TextEditingController _nobCityContr = TextEditingController();
  final TextEditingController _noAddressContr = TextEditingController();
  final TextEditingController _identityTypeContr = TextEditingController();
  final TextEditingController _natOfBizContr = TextEditingController();
  final TextEditingController _addressOfBizContr = TextEditingController();
  final TextEditingController _branchAddressOfBizContr =
      TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _identityNumberController =
      TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _avaliabilityCodeController =
      TextEditingController();
  final TextEditingController _registeredOfficeAddressController =
      TextEditingController();
  final TextEditingController _headOfficeAddressController =
      TextEditingController();
  final TextEditingController _companyCityController = TextEditingController();
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController dNameController1 = TextEditingController();
  final TextEditingController dNameController2 = TextEditingController();
  final TextEditingController dNameController3 = TextEditingController();
  final TextEditingController dNameController4 = TextEditingController();
  final TextEditingController dEmailController1 = TextEditingController();
  final TextEditingController dEmailController2 = TextEditingController();
  final TextEditingController dEmailController3 = TextEditingController();
  final TextEditingController dEmailController4 = TextEditingController();
  final TextEditingController dPhoneNumberController1 = TextEditingController();
  final TextEditingController dPhoneNumberController2 = TextEditingController();
  final TextEditingController dPhoneNumberController3 = TextEditingController();
  final TextEditingController dPhoneNumberController4 = TextEditingController();
  final TextEditingController dResAddressController1 = TextEditingController();
  final TextEditingController dResAddressController2 = TextEditingController();
  final TextEditingController dResAddressController3 = TextEditingController();
  final TextEditingController dResAddressController4 = TextEditingController();
  final TextEditingController dCityController1 = TextEditingController();
  final TextEditingController dCityController2 = TextEditingController();
  final TextEditingController dCityController3 = TextEditingController();
  final TextEditingController dCityController4 = TextEditingController();
  final TextEditingController dDateController1 = TextEditingController();
  final TextEditingController dDateController2 = TextEditingController();
  final TextEditingController dDateController3 = TextEditingController();
  final TextEditingController dDateController4 = TextEditingController();
  final TextEditingController dIdentityNumberController1 =
      TextEditingController();
  final TextEditingController dIdentityNumberController2 =
      TextEditingController();
  final TextEditingController dIdentityNumberController3 =
      TextEditingController();
  final TextEditingController dIdentityNumberController4 =
      TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController amountInWordController = TextEditingController();
  final TextEditingController ofEachController = TextEditingController();
  final TextEditingController dividedIntoController = TextEditingController();
  final TextEditingController secNameController = TextEditingController();
  final TextEditingController secEmailController = TextEditingController();
  final TextEditingController secAddressController = TextEditingController();
  final TextEditingController secPhoneController = TextEditingController();
  final TextEditingController secIdentityNumberController =
      TextEditingController();
  final TextEditingController sfNameController = TextEditingController();
  final TextEditingController sfEmailController = TextEditingController();
  final TextEditingController sfPhoneController = TextEditingController();
  final TextEditingController sfAddressController = TextEditingController();
  final TextEditingController sfBnrcController = TextEditingController();
  final TextEditingController sh1NameController = TextEditingController();
  final TextEditingController sh2NameController = TextEditingController();
  final TextEditingController sh1EmailController = TextEditingController();
  final TextEditingController sh2EmailController = TextEditingController();
  final TextEditingController sh1PhoneController = TextEditingController();
  final TextEditingController sh2PhoneController = TextEditingController();
  final TextEditingController sh1AddressController = TextEditingController();
  final TextEditingController sh2AddressController = TextEditingController();
  final TextEditingController sh1IdentityNumberController =
      TextEditingController();
  final TextEditingController sh2IdentityNumberController =
      TextEditingController();
  final TextEditingController sh1NoOfSharesController = TextEditingController();
  final TextEditingController sh2NoOfSharesController = TextEditingController();
  final TextEditingController sh1DateController = TextEditingController();
  final TextEditingController sh2DateController = TextEditingController();
  final TextEditingController objectController = TextEditingController();
  final TextEditingController obNameController = TextEditingController();
  final TextEditingController obAddressController = TextEditingController();
  final TextEditingController obEmailController = TextEditingController();
  final TextEditingController obPhoneController = TextEditingController();
  final TextEditingController obAccreditationController =
      TextEditingController();
  final TextEditingController _fillingNameController = TextEditingController();
  final TextEditingController _fillingAddressController =
      TextEditingController();
  final TextEditingController _fillingEmailController = TextEditingController();
  final TextEditingController _fillingAccreditationController =
      TextEditingController();
  final TextEditingController _fillingPhoneNumberController =
      TextEditingController();

  GlobalKey<FormState> _companyFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fillingNameController.dispose();
    _fillingAddressController.dispose();
    _fillingEmailController.dispose();
    _fillingAccreditationController.dispose();
    _fillingPhoneNumberController.dispose();
    objectController.dispose();
    obNameController.dispose();
    obAddressController.dispose();
    obPhoneController.dispose();
    obEmailController.dispose();
    obAccreditationController.dispose();
    sh1NoOfSharesController.dispose();
    sh1DateController.dispose();
    sh2NameController.dispose();
    sh2DateController.dispose();
    sh1NameController.dispose();
    sh1EmailController.dispose();
    sh1PhoneController.dispose();
    sh1AddressController.dispose();
    sh1IdentityNumberController.dispose();
    sh2NameController.dispose();
    sh2EmailController.dispose();
    sh2AddressController.dispose();
    sh2PhoneController.dispose();
    sh2IdentityNumberController.dispose();
    secNameController.dispose();
    secEmailController.dispose();
    secAddressController.dispose();
    secPhoneController.dispose();
    secIdentityNumberController.dispose();
    sfNameController.dispose();
    sfEmailController.dispose();
    sfAddressController.dispose();
    sfPhoneController.dispose();
    sfBnrcController.dispose();
    amountController.dispose();
    amountInWordController.dispose();
    ofEachController.dispose();
    dividedIntoController.dispose();
    dNameController1.dispose();
    dNameController2.dispose();
    dNameController3.dispose();
    dNameController4.dispose();
    dEmailController1.dispose();
    dEmailController2.dispose();
    dEmailController3.dispose();
    dEmailController4.dispose();
    dPhoneNumberController1.dispose();
    dPhoneNumberController2.dispose();
    dPhoneNumberController3.dispose();
    dPhoneNumberController4.dispose();
    dResAddressController1.dispose();
    dResAddressController2.dispose();
    dResAddressController3.dispose();
    dResAddressController4.dispose();
    dCityController1.dispose();
    dCityController2.dispose();
    dCityController3.dispose();
    dCityController4.dispose();
    dDateController1.dispose();
    dDateController2.dispose();
    dDateController3.dispose();
    dDateController4.dispose();
    dIdentityNumberController1.dispose();
    dIdentityNumberController2.dispose();
    dIdentityNumberController3.dispose();
    dIdentityNumberController4.dispose();
    _companyCityController.dispose();
    _companyEmailController.dispose();
    _companyNameController.dispose();
    _registeredOfficeAddressController.dispose();
    _headOfficeAddressController.dispose();
    _avaliabilityCodeController.dispose();
    _dateController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _identityNumberController.dispose();
    _preferredNameCont.dispose();
    _alternativeNameCont.dispose();
    _dobCont.dispose();
    _noAddressContr.dispose();
    _dobCont.dispose();
    _noAddressContr.dispose();
    _identityTypeContr.dispose();
    _noAddressContr.dispose();
    _natOfBizContr.dispose();
    _addressOfBizContr.dispose();
    _branchAddressOfBizContr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Company Registration'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _companyFormKey,
            child: Column(children: <Widget>[
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
                constraints: BoxConstraints.tightFor(height: 450.0, width: 600),
                child: FAStepper(
                    steps: companyStep(),
                    currentStep: _currentStep,
                    type: FAStepperType.horizontal,
                    stepNumberColor: Theme.of(context).primaryColor,
                    onStepTapped: (step) => goto(step),
                    onStepCancel: cancel,
                    onStepContinue: _currentStep + 1 != companyStep().length
                        ? next
                        : submit,
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
                                title: _currentStep + 1 != companyStep().length
                                    ? 'Next'
                                    : 'Submit',
                                colour: Theme.of(context).primaryColor,
                                onPressed: onStepContinue,
                              ),
                            ),
                          ]);
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  next() {
    goto(_currentStep + 1);
  }

  submit() async {
    if (_companyFormKey.currentState.validate()) {
      if (answerindex == 1) {
        setState(() {
          showSpinner = true;
        });
        await postCompanyWithCode();
        Navigator.pushNamed(context, PaymentPage.id);
        setState(() {
          showSpinner = false;
        });
      } else {
        setState(() {
          showSpinner = true;
        });
        await postCompanyWithOutCode();
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

  List<FAStep> companyStep() {
    List<FAStep> steps = [
      FAStep(
        isActive: _currentStep < 0 ? false : true,
        title: Text('Presenter Details'),
        content: answerindex == 2 ? noToCode() : yesToCode(),
      ),
      FAStep(
        isActive: _currentStep < 1 ? false : true,
        title: Text('Company Address'),
        content: Column(
          children: <Widget>[
            Text(
              'Company Address',
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
              hintText: 'Company Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.text,
              textEditingController: _companyNameController,
            ),
            MyCustomTextForm(
              hintText: 'Availability Code',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _avaliabilityCodeController,
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Registered Office Adress',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.text,
              textEditingController: _registeredOfficeAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Head Office Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.text,
              textEditingController: _headOfficeAddressController,
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
                    value: selectedCompanyState,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        selectedCompanyState = _value;
                        selectedCompanyStateId =
                            statesList.indexOf(selectedCompanyState) + 1;
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
              textEditingController: _companyCityController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: _companyEmailController,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 2 ? false : true,
        title: Text('Share Capital'),
        content: Column(
          children: <Widget>[
            Text(
              'Share Capital',
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Norminal Share Capital in Digits:'),
                MyCustomTextForm(
                  hintText: 'Amount in Digits',
                  outlineInputBorder: OutlineInputBorder(),
                  isPassword: false,
                  textInputType: TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  textEditingController: amountController,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Norminal Share Capital in Words:'),
                MyCustomTextForm(
                  hintText: 'Amount in Words',
                  outlineInputBorder: OutlineInputBorder(),
                  isPassword: false,
                  textInputType: TextInputType.text,
                  textEditingController: amountInWordController,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Divided into(Number of units):'),
                MyCustomTextForm(
                  outlineInputBorder: OutlineInputBorder(),
                  isPassword: false,
                  textInputType: TextInputType.number,
                  textEditingController: dividedIntoController,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Of Each(Price per unit)'),
                MyCustomTextForm(
                  hintText: 'Amount in Digits',
                  outlineInputBorder: OutlineInputBorder(),
                  isPassword: false,
                  textInputType: TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  textEditingController: ofEachController,
                ),
              ],
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 3 ? false : true,
        title: Text('First Directors'),
        content: Column(
          children: <Widget>[
            Text(
              'Particulars of First Directors and their Consent to Act',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: dNameController1,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: dEmailController1,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: dPhoneNumberController1,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Residential Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: dResAddressController1,
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
                    value: dSelectedState1,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedState1 = _value;
                        dSelectedStateId1 =
                            statesList.indexOf(dSelectedState1) + 1;
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
              textEditingController: dCityController1,
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
                    value: dSelectedCountry1,
                    hint: Text(
                      'Country',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedCountry1 = _value;
                        dSelectedCountryId1 =
                            countryList.indexOf(dSelectedCountry1) + 1;
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
              future: networking.getNationalityList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List nationalityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(nationalityList),
                    value: dSelectedNationality1,
                    hint: Text(
                      'Nationality',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedNationality1 = _value;
                        dSelectedNationalityId1 =
                            nationalityList.indexOf(dSelectedNationalityId1) +
                                1;
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
            OutlineDropdownButtonFormField(
              items: getList(genderList),
              value: dSelectedGender1,
              hint: Text(
                'Gender',
              ),
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  dSelectedGender1 = _value;
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
              textEditingController: dDateController1,
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
                    value: dSelectedIdentityType1,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedIdentityType1 = _value;
                        dSelectedIdentityTypeId1 =
                            identityList.indexOf(dSelectedIdentityType1) + 1;
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
              textEditingController: dIdentityNumberController1,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '(2)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: dNameController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: dEmailController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: dPhoneNumberController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Residential Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: dResAddressController2,
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
                    value: dSelectedState2,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedState2 = _value;
                        dSelectedStateId2 =
                            statesList.indexOf(dSelectedState2) + 1;
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
              textEditingController: dCityController2,
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
                    value: dSelectedCountry2,
                    hint: Text(
                      'Country',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedCountry2 = _value;
                        dSelectedCountryId2 =
                            countryList.indexOf(dSelectedCountry2) + 1;
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
              future: networking.getNationalityList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List nationalityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(nationalityList),
                    value: dSelectedNationality2,
                    hint: Text(
                      'Nationality',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedNationality2 = _value;
                        dSelectedNationalityId2 =
                            nationalityList.indexOf(dSelectedNationality2) + 1;
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
            OutlineDropdownButtonFormField(
              items: getList(genderList),
              value: dSelectedGender2,
              hint: Text(
                'Gender',
              ),
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  dSelectedGender2 = _value;
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
              textEditingController: dDateController2,
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
                    value: dSelectedIdentityType2,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedIdentityType2 = _value;
                        dSelectedIdentityTypeId2 =
                            identityList.indexOf(dSelectedIdentityTypeId2) + 1;
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
              textEditingController: dIdentityNumberController2,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '(3)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: dNameController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: dEmailController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: dPhoneNumberController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Residential Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: dResAddressController3,
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
                    value: dSelectedState3,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedState3 = _value;
                        dSelectedStateId3 =
                            statesList.indexOf(dSelectedState3) + 1;
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
              textEditingController: dCityController3,
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
                    value: dSelectedCountry3,
                    hint: Text(
                      'Country',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedCountry3 = _value;
                        dSelectedCountryId3 =
                            countryList.indexOf(dSelectedCountry3) + 1;
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
              future: networking.getNationalityList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List nationalityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(nationalityList),
                    value: selectedNationality,
                    hint: Text(
                      'Nationality',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        selectedNationality = _value;
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
            OutlineDropdownButtonFormField(
              items: getList(genderList),
              value: dSelectedGender3,
              hint: Text(
                'Gender',
              ),
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  dSelectedGender3 = _value;
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
              textEditingController: dDateController3,
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
                    value: dSelectedIdentityType3,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedIdentityType3 = _value;
                        dSelectedIdentityTypeId3 =
                            identityList.indexOf(dSelectedIdentityType3) + 1;
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
              textEditingController: dIdentityNumberController3,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '(4)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: dNameController1,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: dEmailController4,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: dPhoneNumberController4,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Residential Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: dResAddressController4,
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
                    value: dSelectedState4,
                    hint: Text(
                      'State',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedState4 = _value;
                        dSelectedStateId4 =
                            statesList.indexOf(dSelectedState4) + 1;
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
              textEditingController: dCityController4,
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
                    value: dSelectedCountry4,
                    hint: Text(
                      'Country',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedCountry4 = _value;
                        dSelectedCountryId4 =
                            countryList.indexOf(dSelectedCountry4) + 1;
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
              future: networking.getNationalityList(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List nationalityList = snap.data;
                  return OutlineDropdownButtonFormField(
                    items: getList(nationalityList),
                    value: dSelectedNationality4,
                    hint: Text(
                      'Nationality',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedNationality4 = _value;
                        dSelectedNationalityId4 =
                            nationalityList.indexOf(dSelectedNationality4) + 1;
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
            OutlineDropdownButtonFormField(
              items: getList(genderList),
              value: dSelectedGender4,
              hint: Text(
                'Gender',
              ),
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  dSelectedGender4 = _value;
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
              textEditingController: dDateController4,
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
                    value: dSelectedIdentityType4,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        dSelectedIdentityType4 = _value;
                        dSelectedIdentityTypeId4 =
                            identityList.indexOf(dSelectedIdentityType4) + 1;
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
              textEditingController: dIdentityNumberController4,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 4 ? false : true,
        title: Text('Secretary'),
        content: Column(
          children: <Widget>[
            Text(
              'Particulars of Secretary(Individual)',
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
              textEditingController: secNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: secEmailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: secPhoneController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: secAddressController,
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
                    value: secSelectedIdentityType,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        secSelectedIdentityType = _value;
                        secSelectedIdentityTypeId =
                            identityList.indexOf(secSelectedIdentityType) + 1;
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
              textEditingController: secIdentityNumberController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Particulars of Secretary(Firm/Copporation)',
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
              textEditingController: sfNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: sfEmailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: sfPhoneController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: sfAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'BN/RC Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType:
                  TextInputType.numberWithOptions(decimal: true, signed: true),
              textEditingController: sfBnrcController,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 5 ? false : true,
        title: Text('Shareholders'),
        content: Column(
          children: <Widget>[
            Text(
              'Shareholders',
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: sh1NameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: sh1EmailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: sh1PhoneController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: sh1AddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Number of Shares',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: sh1NoOfSharesController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: sh1DateController,
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
                    value: sh1SelectedIdentityType,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        sh1SelectedIdentityType = _value;
                        sh1SelectedIdentityTypeId =
                            identityList.indexOf(sh1SelectedIdentityType) + 1;
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
              textEditingController: sh1IdentityNumberController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '(2)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Full Name',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: sh2NameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: sh2EmailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: sh2PhoneController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: sh2AddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Number of Shares',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: sh2NoOfSharesController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: sh2DateController,
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
                    value: sh2SelectedIdentityType,
                    hint: Text(
                      'Identity Type',
                    ),
                    decoration: dropDownDecoration,
                    onChanged: (_value) {
                      setState(() {
                        sh2SelectedIdentityType = _value;
                        sh2SelectedIdentityTypeId =
                            identityList.indexOf(sh2SelectedIdentityType) + 1;
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
              textEditingController: sh2IdentityNumberController,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 6 ? false : true,
        title: Text('Object & Declaration'),
        content: Column(
          children: <Widget>[
            Text(
              'Object of Company',
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
              textEditingController: objectController,
              maxLine: 3,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Statutory Declaration of Compliance with the requirement of CAMA by a legal practitioner',
              textAlign: TextAlign.center,
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
              textEditingController: obNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: obAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: obEmailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: obPhoneController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Accreditation(if any)',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: obAccreditationController,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 7 ? false : true,
        title: Text('Filing'),
        content: Column(
          children: <Widget>[
            Text(
              'Filing Presented by:',
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
              textEditingController: _fillingNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _fillingAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Email Address',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.emailAddress,
              textEditingController: _fillingEmailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Phone Number',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textInputType: TextInputType.number,
              textEditingController: _fillingPhoneNumberController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              hintText: 'Accreditation(if any)',
              outlineInputBorder: OutlineInputBorder(),
              isPassword: false,
              textEditingController: _fillingAccreditationController,
            ),
          ],
        ),
      ),
    ];
    return steps;
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

  Column yesToCode() {
    return Column(
      children: <Widget>[
        Text(
          'Presenter Details',
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
        OutlineDropdownButtonFormField(
          items: getList(genderList),
          value: selectedGender,
          hint: Text(
            'Gender',
          ),
          decoration: dropDownDecoration,
          onChanged: (_value) {
            setState(() {
              selectedGender = _value;
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
          textEditingController: _dateController,
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
                value: selectedNationality,
                hint: Text(
                  'Nationality',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    selectedNationality = _value;
                    selectedNationalityId =
                        nationalityList.indexOf(selectedNationality) + 1;
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
                value: selectedCountry,
                hint: Text(
                  'Country',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    selectedCountry = _value;
                    selectedCountryId =
                        countryList.indexOf(selectedCountry) + 1;
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
                value: selectedState,
                hint: Text(
                  'State',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    selectedState = _value;
                    selectedStateId = statesList.indexOf(selectedStateId) + 1;
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
        MyCustomTextForm(
          hintText: 'Address',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _addressController,
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
                value: selectedIdentityType,
                hint: Text(
                  'Identity Type',
                ),
                decoration: dropDownDecoration,
                onChanged: (_value) {
                  setState(() {
                    selectedIdentityType = _value;
                    identityTypeId =
                        identityList.indexOf(selectedIdentityType) + 1;
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
        MyCustomTextForm(
          hintText: 'Identity Number',
          isPassword: false,
          outlineInputBorder: OutlineInputBorder(),
          textEditingController: _identityNumberController,
        ),
      ],
    );
  }

  Future<void> postCompanyWithCode() async {
    String url = 'https://klasskorporate.com/api/companies';
    Map<String, dynamic> postData = {
      "question": answer,
      "gender": selectedGender,
      "dob": _dateController.text,
      "nationality_id": selectedNationalityId,
      "country_id": selectedCountryId,
      "state_id": selectedStateId,
      "city": _cityController.text,
      "address": _addressController.text,
      "identity_type_id": selectedIdentityType,
      "identity_type_number": _identityNumberController.text,
      "cname": _companyNameController.text,
      "availability_code": _avaliabilityCodeController.text,
      "registered_office_address": _registeredOfficeAddressController.text,
      "head_office_address": _headOfficeAddressController.text,
      "email": _companyEmailController.text,
      "nominal_share_capital": amountController.text,
      "nominal_share_capital_word": amountInWordController.text,
      "divided_into": dividedIntoController.text,
      "divided_of_each": ofEachController.text,
      "dname": [
        dNameController1.text,
        dNameController2.text,
        dNameController3.text,
        dNameController4.text
      ],
      "demail": [
        dEmailController1.text,
        dNameController2.text,
        dEmailController3.text,
        dEmailController4.text
      ],
      "dphone_number": [
        dPhoneNumberController1.text,
        dPhoneNumberController2.text,
        dPhoneNumberController3.text,
        dPhoneNumberController4.text
      ],
      "dresidential_address": [
        dResAddressController1.text,
        dResAddressController2.text,
        dResAddressController3.text,
        dResAddressController4.text
      ],
      "dcity": [
        dCityController1.text,
        dCityController2.text,
        dCityController3.text,
        dCityController4.text
      ],
      "dstate_id": [
        dSelectedStateId1,
        dSelectedStateId2,
        dSelectedStateId3,
        dSelectedStateId4
      ],
      "dcountry_id": [
        dSelectedCountryId1,
        dSelectedCountryId2,
        dSelectedCountryId3,
        dSelectedCountryId4
      ],
      "dnationality_id": [
        dSelectedNationalityId1,
        dSelectedNationalityId2,
        dSelectedNationalityId3,
        dSelectedNationalityId4
      ],
      "dgender": [
        dSelectedGender1,
        dSelectedGender2,
        dSelectedGender3,
        dSelectedGender4
      ],
      "ddate_of_birth": [
        dDateController1.text,
        dDateController2.text,
        dDateController3.text,
        dDateController4.text
      ],
      "didentity_type_id": [
        dSelectedIdentityTypeId1,
        dSelectedIdentityTypeId2,
        dSelectedIdentityTypeId3,
        dSelectedIdentityTypeId4
      ],
      "didentity_type_number": [
        dIdentityNumberController1.text,
        dIdentityNumberController2.text,
        dIdentityNumberController3.text,
        dIdentityNumberController4.text
      ],
      "si_name": secNameController.text,
      "si_email": secEmailController.text,
      "si_address": secAddressController.text,
      "si_phone_number": secPhoneController.text,
      "si_identity_type_id": secSelectedIdentityTypeId,
      "si_identity_type_number": secIdentityNumberController.text,
      "sf_name": sfNameController.text,
      "sf_email": sfEmailController.text,
      "sf_phone_number": sfPhoneController.text,
      "sf_address": sfAddressController.text,
      "sf_bn_rc_number": sfBnrcController.text,
      "share_name": [sh1NameController.text, sh2NameController.text],
      "share_email": [sh1EmailController.text, sh2EmailController.text],
      "share_phone_number": [sh1PhoneController.text, sh2PhoneController.text],
      "share_address": [sh1AddressController.text, sh2AddressController.text],
      "share_number_of_shares": [
        sh1NoOfSharesController.text,
        sh2NoOfSharesController.text
      ],
      "share_date_of_birth": [sh1DateController.text, sh2DateController.text],
      "share_identity_type_id": [
        sh1SelectedIdentityTypeId,
        sh2SelectedIdentityTypeId
      ],
      "share_identity_type_number": [
        sh1IdentityNumberController.text,
        sh2IdentityNumberController.text
      ],
      "object": objectController.text,
      "deponent_name": obNameController.text,
      "deponent_address": obAddressController.text,
      "deponent_phone_number": obPhoneController.text,
      "deponent_email": obEmailController.text,
      "deponent_accreditation_number": obAccreditationController.text,
      "filing_name": _fillingNameController.text,
      "filing_address": _fillingAddressController.text,
      "filing_phone_number": _fillingPhoneNumberController.text,
      "filing_email": _fillingEmailController.text,
      "filing_accreditation_number": _fillingAccreditationController.text
    };
    await networking.postOther(urls: url, map: postData);
  }

  Future<void> postCompanyWithOutCode() async {
    String url = 'https://klasskorporate.com/api/companies';
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
      "registered_office_address": _registeredOfficeAddressController.text,
      "head_office_address": _headOfficeAddressController.text,
      "email": _companyEmailController.text,
      "nominal_share_capital": amountController.text,
      "nominal_share_capital_word": amountInWordController.text,
      "divided_into": dividedIntoController.text,
      "divided_of_each": ofEachController.text,
      "dname": [
        dNameController1.text,
        dNameController2.text,
        dNameController3.text,
        dNameController4.text
      ],
      "demail": [
        dEmailController1.text,
        dNameController2.text,
        dEmailController3.text,
        dEmailController4.text
      ],
      "dphone_number": [
        dPhoneNumberController1.text,
        dPhoneNumberController2.text,
        dPhoneNumberController3.text,
        dPhoneNumberController4.text
      ],
      "dresidential_address": [
        dResAddressController1.text,
        dResAddressController2.text,
        dResAddressController3.text,
        dResAddressController4.text
      ],
      "dcity": [
        dCityController1.text,
        dCityController2.text,
        dCityController3.text,
        dCityController4.text
      ],
      "dstate_id": [
        dSelectedStateId1,
        dSelectedStateId2,
        dSelectedStateId3,
        dSelectedStateId4
      ],
      "dcountry_id": [
        dSelectedCountryId1,
        dSelectedCountryId2,
        dSelectedCountryId3,
        dSelectedCountryId4
      ],
      "dnationality_id": [
        dSelectedNationalityId1,
        dSelectedNationalityId2,
        dSelectedNationalityId3,
        dSelectedNationalityId4
      ],
      "dgender": [
        dSelectedGender1,
        dSelectedGender2,
        dSelectedGender3,
        dSelectedGender4
      ],
      "ddate_of_birth": [
        dDateController1.text,
        dDateController2.text,
        dDateController3.text,
        dDateController4.text
      ],
      "didentity_type_id": [
        dSelectedIdentityTypeId1,
        dSelectedIdentityTypeId2,
        dSelectedIdentityTypeId3,
        dSelectedIdentityTypeId4
      ],
      "didentity_type_number": [
        dIdentityNumberController1.text,
        dIdentityNumberController2.text,
        dIdentityNumberController3.text,
        dIdentityNumberController4.text
      ],
      "si_name": secNameController.text,
      "si_email": secEmailController.text,
      "si_address": secAddressController.text,
      "si_phone_number": secPhoneController.text,
      "si_identity_type_id": secSelectedIdentityTypeId,
      "si_identity_type_number": secIdentityNumberController.text,
      "sf_name": sfNameController.text,
      "sf_email": sfEmailController.text,
      "sf_phone_number": sfPhoneController.text,
      "sf_address": sfAddressController.text,
      "sf_bn_rc_number": sfBnrcController.text,
      "share_name": [sh1NameController.text, sh2NameController.text],
      "share_email": [sh1EmailController.text, sh2EmailController.text],
      "share_phone_number": [sh1PhoneController.text, sh2PhoneController.text],
      "share_address": [sh1AddressController.text, sh2AddressController.text],
      "share_number_of_shares": [
        sh1NoOfSharesController.text,
        sh2NoOfSharesController.text
      ],
      "share_date_of_birth": [sh1DateController.text, sh2DateController.text],
      "share_identity_type_id": [
        sh1SelectedIdentityTypeId,
        sh2SelectedIdentityTypeId
      ],
      "share_identity_type_number": [
        sh1IdentityNumberController.text,
        sh2IdentityNumberController.text
      ],
      "object": objectController.text,
      "deponent_name": obNameController.text,
      "deponent_address": obAddressController.text,
      "deponent_phone_number": obPhoneController.text,
      "deponent_email": obEmailController.text,
      "deponent_accreditation_number": obAccreditationController.text,
      "filing_name": _fillingNameController.text,
      "filing_address": _fillingAddressController.text,
      "filing_phone_number": _fillingPhoneNumberController.text,
      "filing_email": _fillingEmailController.text,
      "filing_accreditation_number": _fillingAccreditationController.text
    };

    await networking.postOther(urls: url, map: postData);
  }
}

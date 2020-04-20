import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:klass_korporate/model/dropdown_datas.dart';
import 'package:klass_korporate/screens/widgets/roundButton.dart';
import 'package:klass_korporate/screens/widgets/textformfield.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:klass_korporate/screens/payment.dart';

class CompanyProfilingForm extends StatefulWidget {
  static const String id = 'Company_profiling_form';

  @override
  _CompanyProfilingFormState createState() => _CompanyProfilingFormState();
}

class _CompanyProfilingFormState extends State<CompanyProfilingForm> {
  Networking networking = Networking();
  InputDecoration dropDownDecoration = InputDecoration(
      contentPadding: EdgeInsets.all(4), border: OutlineInputBorder());
  int _currentStep = 0;
  bool complete = false;
  String typeOfBusiness;
  bool disableDropDown = true;
  bool haveNameReservationCode = true;
  int typeOfBusinessId;
  bool  showSpinner = false;
  GlobalKey<FormState> _companyProfFormKey = GlobalKey<FormState>();

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _regCompanyAddressController =
      TextEditingController();
  final TextEditingController noOfPagesController = TextEditingController();
  final TextEditingController vitalInfoController = TextEditingController();
  final TextEditingController listOfDocController = TextEditingController();
  final TextEditingController listOfPastProController = TextEditingController();
  final TextEditingController _businessObjController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Company Profiling'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _companyProfFormKey,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 600),
              child: FAStepper(
                  steps: companyProfilingStep(),
                  currentStep: _currentStep,
                  type: FAStepperType.horizontal,
                  onStepTapped: (step) => goto(step),
                  onStepCancel: cancel,
                  onStepContinue: _currentStep + 1 != companyProfilingStep().length? next:submit,
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
                                  _currentStep + 1 != companyProfilingStep().length
                                      ? 'Next'
                                      : 'Submit',
                              colour: Theme.of(context).primaryColor,
                              onPressed: onStepContinue),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
  submit()async{
    if (_companyProfFormKey.currentState.validate()) {
      _companyProfFormKey.currentState.save();
      showSpinner = true;
      try {
        await postCompanyProfiling();
        Navigator.pushNamed(
            context, PaymentPage.id);
        showSpinner = false;
      }catch(e){
        print(e);
      }
    }
  }
  next() {
    if (_companyProfFormKey.currentState.validate()) {
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

  List<FAStep> companyProfilingStep() {
    List<FAStep> step = [
      FAStep(
        isActive: _currentStep < 0 ? false : true,
        title: Text('About Company'),
        content: Column(
          children: <Widget>[
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Name of Company',
              textEditingController: _companyNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Registered address of company',
              textEditingController: _regCompanyAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            OutlineDropdownButtonFormField(
              items: getList(businessTypeList),
              hint: Text('Type of Business'),
              value: typeOfBusiness,
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  typeOfBusiness = _value;
                  typeOfBusinessId =
                      businessTypeList.indexOf(typeOfBusiness) + 1;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Expected number of pages',
              textInputType: TextInputType.number,
              textEditingController: noOfPagesController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Vital information about company',
              maxLine: 3,
              textEditingController: vitalInfoController,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 1 ? false : true,
        title: Text('Documents'),
        content: Column(
          children: <Widget>[
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'List of Documents of Certification(if any)',
              maxLine: 3,
              textEditingController: listOfDocController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'List of Documents or Pictures of past projects',
              maxLine: 3,
              textEditingController: listOfPastProController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Objective of business',
              maxLine: 3,
              textEditingController: _businessObjController,
            ),
          ],
        ),
      ),
    ];
    return step;
  }

  Future<void> postCompanyProfiling() async {
    String url = 'https://klasskorporate.com/api/companyprofile';
    Map<String, dynamic> postComProf = {
      "name": _companyNameController.text,
      "address": _regCompanyAddressController.text,
      "type_of_business": typeOfBusiness,
      "number_of_pages": noOfPagesController.text,
      "documents_of_certification": listOfDocController.text,
      "objective": _businessObjController.text,
      "about": vitalInfoController.text,
      "past_projects": listOfPastProController.text
    };
    await networking.postOther(urls: url, map: postComProf);
  }
}

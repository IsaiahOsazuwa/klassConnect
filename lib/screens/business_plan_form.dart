import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:klass_korporate/model/dropdown_datas.dart';
import 'package:klass_korporate/screens/widgets/roundButton.dart';
import 'package:klass_korporate/screens/widgets/textformfield.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:klass_korporate/screens/payment.dart';

class BusinessPlanForm extends StatefulWidget {
  static const String id = 'business_plan_form';

  @override
  _BusinessPlanFormState createState() => _BusinessPlanFormState();
}

class _BusinessPlanFormState extends State<BusinessPlanForm> {
  Networking networking = Networking();
  int _currentStep = 0;
  bool complete = false;
  String businessType;
  bool disableDropDown = true;
  bool haveNameReservationCode = true;
  GlobalKey<FormState> _businessPlanFormKey = GlobalKey<FormState>();

  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessAddressController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _visionController = TextEditingController();
  final TextEditingController _meetNeedController = TextEditingController();
  final TextEditingController _acquireCustomerController =
      TextEditingController();
  final TextEditingController _mainCustomerController = TextEditingController();
  final TextEditingController _betterCompetitorController =
      TextEditingController();
  final TextEditingController _professionalAdvisoryController =
      TextEditingController();
  final TextEditingController _proposedCapitalController =
      TextEditingController();
  final TextEditingController _borrowingsController = TextEditingController();
  final TextEditingController _additionalFundingController =
      TextEditingController();
  final TextEditingController _spendInvestorController =
      TextEditingController();
  final TextEditingController _averagePriceController = TextEditingController();
  final TextEditingController _averageCostController = TextEditingController();
  final TextEditingController _noOfStaffController = TextEditingController();
  final TextEditingController _staffingFitController = TextEditingController();
  final TextEditingController _existingAssetController =
      TextEditingController();
  final TextEditingController _bookBalanceController = TextEditingController();
  final TextEditingController _exitPlanController = TextEditingController();
  final TextEditingController _annualRentController = TextEditingController();
  final TextEditingController _averageStaffSalaryController =
      TextEditingController();
  final TextEditingController _personalExitPlanController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Business Plan Registration'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _businessPlanFormKey,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 600.0),
            child: FAStepper(
              steps: businessPlanStep(),
              currentStep: _currentStep,
              type: FAStepperType.horizontal,
              onStepTapped: (step) => goto(step),
              onStepCancel: cancel,
              onStepContinue:
                  _currentStep + 1 != businessPlanStep().length ? next : submit,
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
                        title: _currentStep + 1 != businessPlanStep().length
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
    );
  }

  submit() async {
    if (_businessPlanFormKey.currentState.validate()) {
      try {
        await postBusinessPlan();
        Navigator.pushNamed(context, PaymentPage.id);
      } catch (e) {
        print(e);
      }
    }
  }

  next() {
    if(_businessPlanFormKey.currentState.validate()){
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

  List<FAStep> businessPlanStep() {
    List<FAStep> step = [
      FAStep(
        isActive: _currentStep < 0 ? false : true,
        title: Text('About Business'),
        content: Column(
          children: <Widget>[
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Owner Name',
              textEditingController: _ownerNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Business Name',
              textEditingController: _businessNameController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Business Address',
              textEditingController: _businessAddressController,
            ),
            SizedBox(
              height: 10.0,
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              hintText: 'Phone Number',
              textInputType: TextInputType.number,
              textEditingController: _phoneController,
            ),
            SizedBox(
              height: 10.0,
            ),
            OutlineDropdownButtonFormField(
              items: getList(businessTypeList),
              hint: Text('Type of Business'),
              value: businessType,
              decoration: dropDownDecoration,
              onChanged: (_value) {
                setState(() {
                  businessType = _value;
                });
              },
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 1 ? false : true,
        title: Text('Questionnaire 1'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'What is the vision of your business?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _visionController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'How do you think your business meets the need in the market?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _meetNeedController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'How do you plan to acquire and retain customers?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _acquireCustomerController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Who would you consider as the main competitor(s) in your industry?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _mainCustomerController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'What makes you better than competitors, current and future?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _betterCompetitorController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Do you have professional advisors or advisory board?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _professionalAdvisoryController,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 2 ? false : true,
        title: Text('Questionnaire 2'),
        content: Column(
          children: <Widget>[
            Text(
              'How much is your proposed start-up capital?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _proposedCapitalController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Do you currently have any borrowings?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _borrowingsController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'For existing businesses what is your additional funding requirement?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _additionalFundingController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'How do you intend to spend investors money and how soon do you plan to break even?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _spendInvestorController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'What is the average selling price of your product(s)/service(s)?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _averagePriceController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'What is the average cost of providing the product(s)/services(s) stated above?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _averageCostController,
            ),
          ],
        ),
      ),
      FAStep(
        isActive: _currentStep < 3 ? false : true,
        title: Text('Questionnaire 3'),
        content: Column(
          children: <Widget>[
            Text(
              'How many staff do you employ?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _noOfStaffController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'What is the average staff salary?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _averageStaffSalaryController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Does your present staffing fit the status of your business?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _staffingFitController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'What is the value of your existing or proposed asset?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _existingAssetController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'What is your current book balance(Profit and loss statement)?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _bookBalanceController,
            ),
            Text(
              'What is the exit plan?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _exitPlanController,
            ),
            Text(
              'What is your personnal exit plan?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _personalExitPlanController,
            ),
            Text(
              'How much is your annual rent?',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17),
            ),
            MyCustomTextForm(
              isPassword: false,
              outlineInputBorder: OutlineInputBorder(),
              maxLine: 3,
              textEditingController: _annualRentController,
            ),
          ],
        ),
      ),
    ];
    return step;
  }

  Future<void> postBusinessPlan() async {
    String url = 'https://klasskorporate.com/api/businessplans';
    Map<String, dynamic> map = {
      "owner_name": _ownerNameController.text,
      "business_name": _businessNameController.text,
      "business_address": _businessAddressController.text,
      "phone_number": _phoneController.text,
      "type_of_business": businessType,
      "vision": _visionController.text,
      "meet_needs": _meetNeedController.text,
      "acquire_customers": _acquireCustomerController.text,
      "main_competitors": _mainCustomerController.text,
      "better_than_competitors": _betterCompetitorController.text,
      "professional_advisors": _professionalAdvisoryController.text,
      "startup_capital": _proposedCapitalController.text,
      "borrowings": _borrowingsController.text,
      "funding_requirement": _additionalFundingController.text,
      "break_even": _spendInvestorController.text,
      "selling_price": _averagePriceController.text,
      "average_cost": _averageCostController.text,
      "annual_rent": _annualRentController.text,
      "staff": _noOfStaffController.text,
      "staff_salary": _averageStaffSalaryController.text,
      "present_staffing": _spendInvestorController.text,
      "proposed_assets": _existingAssetController.text,
      "book_balance": _bookBalanceController.text,
      "business_exit_plan": _exitPlanController.text,
      "personal_exit_plan": _personalExitPlanController.text
    };
    await networking.postOther(urls: url, map: map);
  }
}

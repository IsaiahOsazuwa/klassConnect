import 'package:klass_korporate/model/dropdown_datas.dart';

class Classification {
  int id;
  String name;
  List<SpecificType> specificTypes;

  Classification({this.id, this.name, this.specificTypes});

  factory Classification.fromJason(Map<String, dynamic> classificationData) {
    List list = classificationData['specific_type'];
    List specificTypeList = list.map((i) => SpecificType.fromJason(i)).toList();
    return Classification(
      id: classificationData['id'],
      name: classificationData['name'],
      specificTypes: specificTypeList,
    );
  }

  List<String> getClassificationData(List<Classification> classificationData) {
    List<String> classificationList = [];
    for (int i = 0; i < classificationData.length; i++) {
      String classifiname = classificationData[i].name;
      classificationList.add(classifiname);
    }
    return classificationList;
  }

  List<String> getSpecificTypeData(List<Classification> classificationData) {
    List<String> specTypeName = [];
    for (int i = 0; i < classificationData.length; i++) {
      List specType = classificationData[i].specificTypes;
      for (int i = 0; i < specType.length; i++) {
        String specificTypeName = specType[i].specificTypeName;
        specTypeName.add(specificTypeName);
      }
    }

    return specTypeName;
  }
}

class SpecificType {
  int specificTypeId;
  String specificTypeName;

  SpecificType({this.specificTypeId, this.specificTypeName});

  factory SpecificType.fromJason(Map<String, dynamic> spec) {
    return SpecificType(
      specificTypeName: spec['name'],
      specificTypeId: spec['id'],
    );
  }
}

class CaseType {
  String caseTypeName;
  List<String> caseSubTypes;

}

List<CaseType> getCaseTypes() {
  List<CaseType> caseTypes = List<CaseType>();
  CaseType caseTypeModel = CaseType();

  caseTypeModel.caseTypeName = 'Bankruptcy';
  caseTypeModel.caseSubTypes = ['','',''];
  caseTypes.add(caseTypeModel); 

  caseTypeModel = new CaseType();

  caseTypeModel.caseTypeName = 'Business Law';
  caseTypeModel.caseSubTypes = ['','',''];
  caseTypes.add(caseTypeModel);

  caseTypeModel = CaseType();

  caseTypeModel.caseTypeName = 'Criminal Defense';
  caseTypeModel.caseSubTypes = ['','',''];
  caseTypes.add(caseTypeModel);

  caseTypeModel = CaseType();

  caseTypeModel.caseTypeName = 'Divorce';
  caseTypeModel.caseSubTypes = ['','',''];
  caseTypes.add(caseTypeModel);

  caseTypeModel = CaseType();

  caseTypeModel.caseTypeName = 'Government';
  caseTypeModel.caseSubTypes = ['','',''];
  caseTypes.add(caseTypeModel);

  caseTypeModel = CaseType();

  caseTypeModel.caseTypeName = 'Health Care & Social';
  caseTypeModel.caseSubTypes = ['','',''];
  caseTypes.add(caseTypeModel);

  caseTypeModel = CaseType();

  caseTypeModel.caseTypeName = 'Real Estate';
  caseTypeModel.caseSubTypes = ['','',''];
  caseTypes.add(caseTypeModel);

  return caseTypes;
}
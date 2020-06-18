import 'package:flutter/cupertino.dart';

class SpecialityModel{

  String imgAssetPath;
  String speciality;
  int noOfDoctors;
  Color backgroundColor;
  SpecialityModel({this.imgAssetPath,this.speciality,this.noOfDoctors, this.backgroundColor});
}

List<SpecialityModel> getSpeciality(){

  List<SpecialityModel> specialities = new List<SpecialityModel>();
  SpecialityModel specialityModel = new SpecialityModel();

  //1
  specialityModel.noOfDoctors = 10;
  specialityModel.speciality = "Bankruptcy";
  specialityModel.imgAssetPath = "images/img1.jpg";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //2
  specialityModel.noOfDoctors = 17;
  specialityModel.speciality = "Business Law";
  specialityModel.imgAssetPath = "images/img2.jpg";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //3
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Criminal Defense";
  specialityModel.imgAssetPath = "images/img3.jpg";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Divorce";
  specialityModel.imgAssetPath = "images/img4.jpg";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Government";
  specialityModel.imgAssetPath = "images/img5.jpg";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Health Care & Social";
  specialityModel.imgAssetPath = "images/img6.jpg";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Immigration";
  specialityModel.imgAssetPath = "images/img7.jpg";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Intellectual Property";
  specialityModel.imgAssetPath = "images/img8.jpg";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Litigation";
  specialityModel.imgAssetPath = "images/img9.jpg";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Medical Malpractice";
  specialityModel.imgAssetPath = "images/img10.jpg";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Motor Vehicle Accidents";
  specialityModel.imgAssetPath = "images/img11.jpg";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Personal Injury";
  specialityModel.imgAssetPath = "images/img12.jpg";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();
  
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Real Estate";
  specialityModel.imgAssetPath = "images/img13.jpg";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Tax";
  specialityModel.imgAssetPath = "images/img14.jpg";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);
  
  
  return specialities;
}
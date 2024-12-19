import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TechnicalInformation/technical_information_model.dart';


class TechnicalInformationController extends GetxController with StateMixin<TechnicalInformationModel>{
int? TransactiID ;


  late TextEditingController RegistrationnumberController;
  late TextEditingController DateOfRegistrationControll;
  late TextEditingController EntityNumberController;
  late TextEditingController EntityNameController;
  late TextEditingController TheTopicController;
  late TextEditingController MessageNumberController;
  late TextEditingController MessageDateController;
  late TextEditingController StatementController;
  late TextEditingController PredicatesController;
  late TextEditingController NoteController;


  late TextEditingController DateHigryControll;
  late TextEditingController FinalActionControll;



  late TextEditingController SessionTypeController;




late TextEditingController SideController;
late TextEditingController DocumentTypeController;
 
late TextEditingController ListStatusController;
// late TextEditingController DepartmentController;
late TextEditingController DepartmentUserController;
// late TextEditingController NatureTransactionController;
late TextEditingController DeliveryMethodController;
// late TextEditingController SecretDegreeController;
// late TextEditingController ImportanceDegreeController;
late TextEditingController UserFullNameController;
late TextEditingController UserFullNameIDController;
late TextEditingController searchController;


onChanSideFilter(String text,int? ID ) {
  this.SideController.text = text;
  this.TypeSideId=ID;
  print("ID="+ID.toString());
}
// onChangeTypeTransction(String? text,int? id  ) {
//   this.TypeTransactionsController.text = text!;
//   this.TypeTransactionsID.value=id!;
// }
onChangeDocumentType(String? text,int? id  ) {
  this.DocumentTypeController.text = text!;
  this.DocumentTypeID.value=id!;
}
onChangeListStatus(String? text,int? id  ) {
  this.ListStatusController.text = text!;
  this.ListStatusID.value=id!;
}
// onChangeDepartment(String? text,int? id  ) {
//   this.DepartmentController.text = text!;
//   this.DepartmentID.value=id!;
// }
onChangeDepartmentUser(String? text,int? id  ) {
  this.DepartmentUserController.text = text!;
  this.DepartmentUserID.value=id!;
}
// onChangeNatureTransaction(String? text,int? id  ) {
//   this.NatureTransactionController.text = text!;
//   this.NatureTransactionID.value=id!;
// }
onChangeDeliveryMethod(String? text,int? id  ) {
  this.DeliveryMethodController.text = text!;
  this.DeliveryMethodID.value=id!;
}
// onChangeSecretDegree(String? text,int? id  ) {
//   this.SecretDegreeController.text = text!;
//   this.SecretDegreeID.value=id!;
// }
// onChangeImportanceDegree(String? text,int? id  ) {
//   this.ImportanceDegreeController.text = text!;
//   this.ImportanceDegreeID.value=id!;
// }
onChangeUserFullName(String? text,int? id  ) {
  print("texttext="+text.toString());
  print("idid="+id.toString());
  this.UserFullNameController.text = text!;
  this.UserFullNameIDController.text = id.toString()!;
  this.UserFullID.value=id!;
  update();
}

  int selectedIndextab1 = 1;
  int selectedIndextab2 = 0;
  int selectedIndextab3 = 0;
  int selectedIndextab4 = 0;
  int selectedIndextab5 = 0;
  int selectedIndextab6 = 0;
  bool checkValue=false;
  //int? radio_email = 0;
  int? radio = 0;
  int? TypeSideId;
  RxInt SesssinTypeEditID=0.obs;
  RxInt DocumentTypeID=0.obs;
   
  RxInt ListStatusID=0.obs;
  
  RxInt DepartmentUserID=0.obs;
   
  RxInt DeliveryMethodID=0.obs;
   
  RxInt UserFullID=0.obs;
  var itemstypSessions=[
    {"id": 1, "name":'حضور'}, {"id": 2, "name":'عن بعد' },
  ];



  onselectedIndexAfter(int select) {
    if(select==1){
      selectedIndextab1=1;
    }
    else if(select==2){
      selectedIndextab2=1;
    }
    else if(select==3){
      selectedIndextab3=1;
    }
    if(select==4){
      selectedIndextab4=1;
    }
    print("selectedIndextab1 =="+selectedIndextab1.toString());
    print("selectedIndextab2 =="+selectedIndextab2.toString());
    print("selectedIndextab3 =="+selectedIndextab3.toString());
    print("selectedIndextab4 =="+selectedIndextab4.toString());
    update();
  }
  onselectedIndexBefore(int select) {
    if(select==1){
      selectedIndextab1=0;
    }
    else if(select==2){
      selectedIndextab2=0;
    }
    else if(select==3){
      selectedIndextab3=0;
    }
    if(select==4){
      selectedIndextab4=0;
    }
    print("selectedIndextab1 =="+selectedIndextab1.toString());
    print("selectedIndextab2 =="+selectedIndextab2.toString());
    print("selectedIndextab3 =="+selectedIndextab3.toString());
    print("selectedIndextab4 =="+selectedIndextab4.toString());
    update();
  }

  onChangeSessionType(String? text,int? id  ) {
    this.SessionTypeController.text = text!;
    this.SesssinTypeEditID.value=id!;
  }

  // List<DataMemb> dateListMember = [];
  onClickRadiosms(int radio) {
    this.radio = radio;
    update();
  }
  onClickRadioEmail(int radio) {
    this.radio = radio;
    update();
  }


  RxBool valuefirst = false.obs;
  RxBool valuesecond = false.obs;

  int  Allow_Comment=0;
  onClickCheckbox(RxBool check) {
    this.valuefirst = check;
    update();
  }


  void onInit() async {
    // TODO: implement onInit
    UserFullNameController = TextEditingController(text: '');
    RegistrationnumberController = TextEditingController(text: '');
    DateOfRegistrationControll = TextEditingController(text: '');
    EntityNumberController = TextEditingController(text: '');
    EntityNameController = TextEditingController(text: '');
    TheTopicController = TextEditingController(text: '');
    MessageNumberController = TextEditingController(text: '');
    MessageDateController = TextEditingController(text: '');
    StatementController = TextEditingController(text: '');
    PredicatesController = TextEditingController(text: '');
    NoteController = TextEditingController(text: '');
    UserFullNameIDController = TextEditingController(text: '');
    FinalActionControll = TextEditingController(text: '');
     DocumentTypeController=TextEditingController(text: '');
    SideController=TextEditingController(text: '');
    ListStatusController = TextEditingController(text: '');
    DepartmentUserController = TextEditingController(text: '');
    DeliveryMethodController = TextEditingController(text: '');


    searchController = TextEditingController(text: '');
    super.onInit();
    TransactiID = stg.read(TransacID);
  }

}


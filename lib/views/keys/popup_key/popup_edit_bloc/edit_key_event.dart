import 'package:flutter/material.dart';
class EditKeyEvent{

}
class OnUpdateButtonClick extends EditKeyEvent{
  String keyName;
  String des;
  OnUpdateButtonClick(this.keyName,this.des);
}
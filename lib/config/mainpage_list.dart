import 'package:flutter/material.dart';
import 'package:project_dvc/view/page/animal.dart';
import 'package:project_dvc/view/page/culture.dart';
import 'package:project_dvc/view/page/finance.dart';
import 'package:project_dvc/view/page/medicine.dart';
import 'package:project_dvc/view/page/person.dart';

class MainPageList {
  final List<String> titleList = ['의료', '사람', '금융', '문화', '동물', '2'];
  final List<IconData> iconList = [
    Icons.medical_services_outlined,
    Icons.person_outline,
    Icons.money_outlined,
    Icons.museum_outlined,
    Icons.pets_outlined,
    Icons.medical_services_outlined,
  ];
  final List<Widget> pageList = [
    Medicine(),
    Person(),
    Finance(),
    Culture(),
    Animal()
  ];
}
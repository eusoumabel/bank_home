import 'package:flutter/material.dart';
import 'package:flutter_challenge_3/data/options_dao.dart';

class OptionsBloc {
  OptionsDAO _dao;

  OptionsBloc() {
    _dao = OptionsDAO();
  }

  getOptions() {
    try {
      var results = _dao.getOptions();
      return results;
    } catch (e) {
      debugPrint("get error = $e");
    }
  }
}

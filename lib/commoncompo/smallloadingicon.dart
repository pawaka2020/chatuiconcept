import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox smallLoadingIcon()=> const SizedBox(
  width: 24,
  height: 24,
  child: Center(
    child: CircularProgressIndicator(),
  ),
);
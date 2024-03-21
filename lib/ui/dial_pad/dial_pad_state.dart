import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class DialPadState extends Equatable{

  final TextEditingController textEditingController;
  final String digit;
  final int getCursorIndex;

  const DialPadState({
    required this.textEditingController,
    this.digit = "",
    this.getCursorIndex=0
  });

  @override
  List<Object?> get props => [textEditingController, digit, getCursorIndex];

  DialPadState copyWith({
    TextEditingController? textEditingController,
    String? digit,
    int? getCursorIndex
  }){
    return DialPadState(
        textEditingController: textEditingController ?? this.textEditingController,
        digit: digit ?? this.digit,
        getCursorIndex: getCursorIndex ?? this.getCursorIndex
    );
  }

}
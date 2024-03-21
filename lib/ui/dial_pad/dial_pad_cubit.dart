import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:iphone_dial_pad/ui/dial_pad/dial_pad_state.dart';
import 'package:url_launcher/url_launcher.dart';

class DialPadCubit extends Cubit<DialPadState>{
  DialPadCubit(super.initialState);


  /// get cursor index
  void getCursorIndex({required int cursorIndex}){
    emit(state.copyWith(getCursorIndex: cursorIndex));
  }


  /// setDigit
  void setDigit({required String digit}){
    String newText = state.textEditingController.text.replaceRange(state.getCursorIndex , state.getCursorIndex, digit);
    print('text ====> $newText');
    state.textEditingController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: state.getCursorIndex+1),
    );
    emit(state.copyWith(getCursorIndex: state.getCursorIndex+1));
    print("add index ====> ${state.getCursorIndex}");
  }


  /// delete digit
  void deleteDigit(){
    //get cursor position  32245   0 2 --->
    print('cursor index ====> ${state.getCursorIndex}');
    String s1 = state.textEditingController.text.substring(0, state.getCursorIndex-1);
    String s2 = state.textEditingController.text.substring(state.getCursorIndex);
    print('s1 text =====> $s1');
    print('s2 text =====> $s2');
    state.textEditingController.text = s1+s2;

    //set cursor position
    state.textEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: state.getCursorIndex-1)
    );

    state.textEditingController.text.isNotEmpty
      ? emit(state.copyWith(getCursorIndex: state.getCursorIndex-1))
      : emit(state.copyWith(getCursorIndex: 0));
    print("remove index ====> ${state.getCursorIndex}");
  }


  /// launch dialer
  directCall(){
    if(state.textEditingController.text.isNotEmpty){
      FlutterPhoneDirectCaller.callNumber(state.textEditingController.text);
    }
  }

}
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:gap/gap.dart';
import 'package:iphone_dial_pad/common_attribute/common_value.dart';
import 'package:iphone_dial_pad/common_widget/common_text.dart';
import 'package:iphone_dial_pad/common_widget/rounded_button.dart';
import 'package:iphone_dial_pad/ui/dial_pad/dial_pad_cubit.dart';
import 'package:iphone_dial_pad/ui/dial_pad/dial_pad_state.dart';
import 'package:flutter/services.dart';

class DialPadUi extends StatefulWidget {
  const DialPadUi({super.key});

  static const String routeName = '/dial_pad_ui';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => DialPadCubit(DialPadState(
        textEditingController: TextEditingController(),
      )),
      child: const DialPadUi(),
    );
  }

  @override
  State<DialPadUi> createState() => _DialPadUiState();
}

class _DialPadUiState extends State<DialPadUi> {

  DialPadCubit get cubit => context.read<DialPadCubit>();
  final FocusNode focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: BlocBuilder<DialPadCubit, DialPadState>(
        builder: (context, state) {
        return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// show phone number
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: Spacing.xxLarge * 1.3,
                ),
                child: AutoSizeTextField(
                  onTap: (){
                    cubit.getCursorIndex(cursorIndex: state.textEditingController.selection.baseOffset);
                    print('index ===> ${state.textEditingController.selection.baseOffset}');
                  },
                  controller: state.textEditingController,
                  showCursor: true,
                  readOnly: true,
                  cursorHeight: TextSize.heading * 2.9,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  minLines: 1,
                  minFontSize: TextSize.appBarTitle,
                  style: const TextStyle(
                      fontWeight: TextWeight.medium,
                      fontSize: TextSize.heading * 2,
                      color: Colors.black
                  ),
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    border: InputBorder.none,
                   contentPadding: EdgeInsetsDirectional.zero
                  ),
                ),
              ),

              /// add Number
              TextButton(
                  style: ButtonStyle(
                      overlayColor:
                      MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () { },
                  child: const CommonText(
                    text: 'Add Number',
                    color: Colors.blue,
                  )),

              const Gap(Spacing.xxLarge),

              /// 0...9
              Container(
                height: MediaQuery.of(context).size.height/1.7,
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: Spacing.large,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: Spacing.xxLarge),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonRoundedButton(
                            title: "1",
                            onTap: (){
                              cubit.setDigit(digit: "1");
                            },
                          ),
                          CommonRoundedButton(
                            title: "2",
                            subTitle: "ABC",
                            onTap: (){
                              cubit.setDigit(digit: "2");
                            },
                          ),
                          CommonRoundedButton(
                            title: "3",
                            subTitle: "DEF",
                            onTap: (){
                              cubit.setDigit(digit: "3");
                              },
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonRoundedButton(
                            title: "4",
                            subTitle: "GHI",
                            onTap: (){
                              cubit.setDigit(digit: "4");
                            },
                          ),
                          CommonRoundedButton(
                            title: "5",
                            subTitle: "JKL",
                            onTap: (){
                              cubit.setDigit(digit: "5");
                            },
                          ),
                          CommonRoundedButton(
                            title: "6",
                            subTitle: "MNO",
                            onTap: (){
                              cubit.setDigit(digit: "6");
                            },
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonRoundedButton(
                            title: "7",
                            subTitle: "PQRS",
                            onTap: (){
                              cubit.setDigit(digit: "7");
                            },
                          ),
                          CommonRoundedButton(
                            title: "8",
                            subTitle: "TUV",
                            onTap: (){
                              cubit.setDigit(digit: "8");
                            },
                          ),
                          CommonRoundedButton(
                            title: "9",
                            subTitle: "WXYZ",
                            onTap: (){
                              cubit.setDigit(digit: "9");
                            },
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonRoundedButton(
                            title: "*",
                            titleTextSize: Spacing.xxLarge+5,
                            onTap: (){
                              cubit.setDigit(digit: "*");
                            },
                          ),
                          CommonRoundedButton(
                            title: "0",
                            subTitle: "+",
                            subTitleTextSize: TextSize.heading,
                            onTap: (){
                              cubit.setDigit(digit: "0");
                            },
                          ),
                          CommonRoundedButton(
                            title: "#",
                            onTap: (){
                              cubit.setDigit(digit: "#");
                            },
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: Spacing.xxLarge),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.greenAccent.shade400,
                              child: IconButton(
                                onPressed: () async{
                                  cubit.directCall();
                                },
                                highlightColor: Colors.transparent,
                                icon: const Icon(Icons.call_rounded, color: Colors.white, size: Spacing.xxLarge,),
                              ),
                            ),
                          ),
                          const Gap(3),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: Spacing.xxLarge-5),
                            child: GestureDetector(
                              onLongPress: (){
                                state.textEditingController.text="";
                                cubit.getCursorIndex(cursorIndex: 0);
                              },
                              child: IconButton(
                                onPressed: (){
                                  print('index => ${state.getCursorIndex}');
                                  cubit.deleteDigit();
                                },
                                icon: const Icon(Icons.backspace_rounded, color: Colors.grey, size: Spacing.xxxLarge,),
                              ),
                            ),
                          ),
                          // const Gap(10),
                        ],
                      )

                    ],
                  ),
                ),
              ),

            ],
          )
        ),
      );
  },
),
    ));
  }
}

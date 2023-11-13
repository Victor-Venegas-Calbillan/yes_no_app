import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    );

    final inputDecaration = InputDecoration(
        hintText: 'end your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: (){
            // final textValue = textController.value.text;
            textController.clear();
          }, 
          icon: const Icon(Icons.send_outlined)
        ),
      );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecaration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer(); 
  final ScrollController chatScrollController = ScrollController( );

  List <Message> messageList = [];

  Future<void> sendMessage ( String text ) async{

    if ( text.isEmpty ) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if( text.endsWith('?')){
      otherReplay();
    }
    
    notifyListeners();
    moveScrolltoBottom();
  }

  Future<void> otherReplay() async{
    final otherMessage = await getYesNoAnswer.getAnswer();

    messageList.add(otherMessage);
    notifyListeners();
    moveScrolltoBottom();

  }

  Future<void> moveScrolltoBottom () async{
    await Future.delayed( const Duration( milliseconds: 100 ) );
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration( milliseconds: 300 ), 
      curve: Curves.easeOut
    );
  }
}
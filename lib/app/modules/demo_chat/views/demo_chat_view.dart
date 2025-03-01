import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gantabbya/app/constants/styles.dart';
import 'package:gantabbya/app/data/remote/models/destination_model.dart';

import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';
import '../controllers/demo_chat_controller.dart';

class DemoChatView extends GetView<DemoChatController> {
  const DemoChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Gantabya Chat bot',
              style: TextStyle(color: AppColors.white),
            ),
            iconTheme: const IconThemeData(color: AppColors.white),
            centerTitle: true,
          ),
          body:  ChatScreen(
            destinationResponse: controller.destinationData,
          )),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final DestinationResponse destinationResponse;
  const ChatScreen({super.key, required this.destinationResponse});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController userInput = TextEditingController();
 late final GenerativeModel model;
  final apiKey = dotenv.env['GEMINI_API_KEY'] ?? "";
  @override
  void initState() {
    super.initState();
    model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: apiKey); // Initialize model here
  }  final List<Message> _messages = [];
  // Future<void> sendMessage() async {
  //   final message = _userInput.text;
  //   setState(() {
  //     _messages
  //         .add(Message(isUser: true, message: message, date: DateTime.now()));
  //   });
  //   final content = [Content.text(message)];
  //   final response = await model.generateContent(content);
  //   setState(() {
  //     _messages.add(Message(
  //         isUser: false, message: response.text ?? "", date: DateTime.now()));
  //   });
  // }

 Future<void> sendMessage() async {
  final message = userInput.text;

  setState(() {
    _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
  });

  if (widget.destinationResponse.data == null) {
    setState(() {
      _messages.add(Message(
          isUser: false,
          message: "Sorry, I don't have information on that.",
          date: DateTime.now()));
    });
    return;
  }
  final prompt = """
  You are a travel chatbot for Nepal. Only answer questions based on the following information:
  ${jsonEncode(widget.destinationResponse)}

  User Question: $message
  """;

  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);

  setState(() {
    _messages.add(Message(
        isUser: false, message: response.text ?? "", date: DateTime.now()));
  });
}

  bool validateInput(String input) {
    final allowedKeywords = ["travel", "destination", "transportation", "accommodation", "flight", "hotel"];
    final forbiddenKeywords = ["politics", "weather", "personal", "weather"];
    final lowerInput = input.toLowerCase();

    if (forbiddenKeywords.any((keyword) => lowerInput.contains(keyword))) {
      return false;
    }

    if (allowedKeywords.any((keyword) => lowerInput.contains(keyword))) {
      return true;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                      isUser: message.isUser,
                      message: message.message,
                      date: DateFormat('HH:mm').format(message.date));
                })),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 15,
                child: TextFormField(
                  style:  AppTextStyles.smallStyle.copyWith(color: Colors.black),
                  controller: userInput,
                  decoration: InputDecoration(
                      fillColor: AppColors.white,
                      filled: true,
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label:  Text('Enter Your Message',
                          style:AppTextStyles.smallStyle,
                      )),
                ),
              ),
              const Spacer(),
              IconButton(
                  padding: const EdgeInsets.all(12),
                  iconSize: 30,
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(const CircleBorder())),
                  onPressed: () {
                    sendMessage();
                  },
                  icon: const Icon(Icons.send))
            ],
          ),
        )
      ],
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;
  Message({required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  const Messages(
      {super.key,
      required this.isUser,
      required this.message,
      required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 15)
          .copyWith(left: isUser ? 100 : 10, right: isUser ? 10 : 100),
      decoration: BoxDecoration(
          color: isUser ? Colors.blueAccent : Colors.grey.shade400,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              bottomLeft: isUser ? const Radius.circular(10) : Radius.zero,
              topRight: const Radius.circular(10),
              bottomRight: isUser ? Radius.zero : const Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
                fontSize: 16, color: isUser ? Colors.white : Colors.black),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 10,
              color: isUser ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

mport 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isSent;
  const ChatMessage({required this.text, required this.isSent});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.shrink(),
    );
  }
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ChatMessage> _messages = [];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(text: text, isSent: true));
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(body: SizedBox.shrink());
}

final ScrollController _scrollController = ScrollController();

void _sendMessage() {
  final text = _controller.text.trim();
  if (text.isEmpty) return;
  setState(() {
    _messages.add(ChatMessage(text: text, isSent: true));
    _controller.clear();
  });
  Future.delayed(const Duration(milliseconds: 100), () {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  });
}
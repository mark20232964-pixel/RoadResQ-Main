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

List<ChatMessage> _messages = [
  const ChatMessage(text: 'Hello!', isSent: true),
  const ChatMessage(text: 'How can I help you today?', isSent: false),
  const ChatMessage(
      text: 'Could you please provide me with some more details about the issue you\'re experiencing?',
      isSent: false),
  const ChatMessage(text: 'Sure', isSent: true),
  const ChatMessage(
      text: 'Whenever I try to view my workout history, the app freezes and crashes.',
      isSent: true),
  const ChatMessage(
      text: 'I\'m sorry to hear that. Let me check that for you. Have you tried restarting the app or your device to see if that resolves the issue?',
      isSent: false),
];
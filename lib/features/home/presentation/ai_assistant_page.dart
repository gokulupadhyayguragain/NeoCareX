import 'package:flutter/material.dart';
import 'package:patient_app/features/home/data/models/message.dart';
import 'package:patient_app/features/home/data/services/n8n_service.dart';
import 'package:patient_app/features/home/data/services/patient_ai_service.dart';
import 'package:patient_app/features/primary/presentation/bloc/bloc/profile_bloc_bloc.dart';

import 'package:fhir/r4.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiAssistantPage extends StatefulWidget {
  const AiAssistantPage({super.key});

  @override
  State<AiAssistantPage> createState() => _AiAssistantPageState();
}

class _AiAssistantPageState extends State<AiAssistantPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final List<Message> _messages = [];
  bool _isTyping = false;

  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;

  late PatientAiService _patientAiService;
  bool _servicesInitialized = false;
  String _patientName = "there";
  String _patientId = '093266f6-6417-4e07-9219-e55bcd8a4e73';
  bool _greetingAdded = false;
  bool _isLoading = true;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeAnimationController,
      curve: Curves.easeOut,
    );

    _fadeAnimationController.forward();

    WidgetsBinding.instance.addObserver(this);
    _initializeServices();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom(animated: false);
      _triggerProfileLoad();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _triggerProfileLoad() {
    try {
      final profileBloc = context.read<ProfileBlocBloc>();
      final state = profileBloc.state;

      if (state is ProfileBlocInitial || state is ProfileLoadingFailed) {
        profileBloc.add(LoadPatientProfile(''));
      } else if (state is ProfileLoaded) {
        _extractPatientName(state.patient);
        if (state.patient.fhirId != null) {
          _patientId = state.patient.fhirId!;
        }
        _isLoading = false;
        if (!_greetingAdded) {
          _addInitialGreeting();
        }
      }
    } catch (e) {
      _isLoading = false;
      _loadFromUserService();
    }
  }

  void _initializeServices() {
    try {
      final String n8nWebhookUrl =
          'https://n8n.gheit.co/webhook/89316a02-98eb-4790-8011-4387e7d98c9b';

      final n8nService = N8nService(n8nWebhookUrl: n8nWebhookUrl);
      _patientAiService = PatientAiService(n8nService: n8nService);
      _servicesInitialized = true;
    } catch (e) {
      debugPrint('[AiAssistantPage] Init error: $e');
    }
  }

  Future<void> _loadFromUserService() async {
    try {
      if (!_greetingAdded && mounted) {
        _addInitialGreeting();
      }
    } catch (e) {
      if (!_greetingAdded && mounted) {
        _addInitialGreeting();
      }
    }
  }

  void _extractPatientName(Patient patient) {
    try {
      if (patient.name != null && patient.name!.isNotEmpty) {
        final firstName = patient.name![0].given?.isNotEmpty == true
            ? patient.name![0].given![0]
            : '';
        final lastName = patient.name![0].family ?? '';

        if (firstName.isNotEmpty || lastName.isNotEmpty) {
          _patientName = "$firstName $lastName".trim();
        }
      }
    } catch (e) {
      debugPrint('[AiAssistantPage] Error extracting patient name: $e');
    }
  }

  Future<void> _addInitialGreeting() async {
    if (_greetingAdded || !mounted) return;

    setState(() {
      _messages.add(
        Message(
          id: const Uuid().v4(),
          senderId: 'assistant',
          senderName: 'Assistant',
          receiverId: _patientId,
          content:
              "Hello $_patientName! 👋 I have access to your full medical history from Aidbox. How can I help you today?",
          sentAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isRead: true,
          hasAttachment: false,
        ),
      );
      _greetingAdded = true;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            _buildAppBar(isDesktop),
            Expanded(
              child: BlocConsumer<ProfileBlocBloc, ProfileBlocState>(
                listener: (context, state) {
                  if (state is ProfileLoaded) {
                    _extractPatientName(state.patient);
                    if (state.patient.fhirId != null) {
                      _patientId = state.patient.fhirId!;
                    }
                    _isLoading = false;
                    if (!_greetingAdded && mounted) {
                      _addInitialGreeting();
                    }
                  } else if (state is ProfileLoading) {
                    setState(() => _isLoading = true);
                  } else if (state is ProfileLoadingFailed) {
                    setState(() => _isLoading = false);
                    if (!_greetingAdded) {
                      _loadFromUserService();
                    }
                  }
                },
                builder: (context, state) {
                  if (_isLoading && _messages.isEmpty) {
                    return _buildLoadingState();
                  }

                  return Container(
                    color: colorScheme.surface,
                    child: Column(
                      children: [
                        Expanded(
                          child: _messages.isEmpty
                              ? _buildEmptyState()
                              : _buildChatList(),
                        ),
                        _buildInputArea(isDesktop),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(bool isDesktop) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: isDesktop ? 15 : 12,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.08),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: colorScheme.onSurface,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(width: isDesktop ? 8 : 4),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.health_and_safety_rounded,
              color: colorScheme.primary,
              size: isDesktop ? 28 : 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medical Assistant',
                  style: TextStyle(
                    fontSize: isDesktop ? 22 : 20,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
          if (isDesktop) ...[
            Text(
              'Secure • Confidential',
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.outline,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.verified_rounded,
                size: 18,
                color: colorScheme.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Loading your health profile...',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This will only take a moment',
            style: TextStyle(fontSize: 14, color: colorScheme.outline),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    final colorScheme = Theme.of(context).colorScheme;
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isDesktop ? 48 : 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: isDesktop ? 120 : 96,
              height: isDesktop ? 120 : 96,
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(isDesktop ? 32 : 24),
              ),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                size: isDesktop ? 60 : 48,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: isDesktop ? 32 : 24),
            Text(
              'Start a Conversation',
              style: TextStyle(
                fontSize: isDesktop ? 26 : 22,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: isDesktop ? 16 : 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isDesktop ? 200 : 32),
              child: Text(
                'Ask me anything about your health records, medications, or symptoms',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? 16 : 14,
                  color: colorScheme.outline,
                  height: 1.5,
                ),
              ),
            ),
            // SizedBox(height: isDesktop ? 40 : 32),
            // _buildSuggestionChips(),
          ],
        ),
      ),
    );
  }

  /*  Widget _buildSuggestionChips() {
    final colorScheme = Theme.of(context).colorScheme;
    final isDesktop = MediaQuery.of(context).size.width > 800;

    final suggestions = [
      'What medications am I taking?',
      'When is my next appointment?',
      'Show my recent lab results',
      'What are my allergies?',
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: suggestions.map((suggestion) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              _controller.text = suggestion;
              _sendMessage();
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 20 : 16,
                vertical: isDesktop ? 12 : 10,
              ),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
              ),
              child: Text(
                suggestion,
                style: TextStyle(
                  fontSize: isDesktop ? 14 : 13,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  } */

  Widget _buildChatList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(20),
      itemCount: _messages.length + (_isTyping ? 1 : 0),
      itemBuilder: (context, index) {
        if (_isTyping && index == _messages.length) {
          return const _TypingIndicator();
        }

        final msg = _messages[index];
        final isMe = msg.senderId == 'user';
        return _ChatBubble(message: msg, isMe: isMe);
      },
    );
  }

  Widget _buildInputArea(bool isDesktop) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasText = _controller.text.trim().isNotEmpty;

    return Container(
      padding: EdgeInsets.all(isDesktop ? 24 : 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: colorScheme.outline.withOpacity(0.08),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: hasText
                      ? colorScheme.primary.withOpacity(0.3)
                      : Colors.transparent,
                  width: 1.2,
                ),
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                maxLines: null,
                minLines: 1,
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(
                  fontSize: isDesktop ? 16 : 15,
                  color: colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: 'Ask about your health...',

                  hintStyle: TextStyle(
                    color: colorScheme.outline.withOpacity(0.6),
                    fontSize: isDesktop ? 16 : 15,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 24 : 20,
                    vertical: isDesktop ? 18 : 14,
                  ),
                ),
                onChanged: (text) => setState(() {}),
                onSubmitted: (_) => _sendMessage(),
                textInputAction: TextInputAction.send,
              ),
            ),
          ),
          const SizedBox(width: 12),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildSendButton() {
    final colorScheme = Theme.of(context).colorScheme;
    final hasText = _controller.text.trim().isNotEmpty;
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: hasText && !_isSending ? _sendMessage : null,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: isDesktop ? 52 : 48,
          height: isDesktop ? 52 : 48,
          decoration: BoxDecoration(
            color: hasText
                ? colorScheme.primary
                : colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(16),
          ),
          child: _isSending
              ? Center(
                  child: SizedBox(
                    width: isDesktop ? 22 : 20,
                    height: isDesktop ? 22 : 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        hasText ? Colors.white : colorScheme.outline,
                      ),
                    ),
                  ),
                )
              : Icon(
                  Icons.send_rounded,
                  size: isDesktop ? 22 : 20,
                  color: hasText
                      ? colorScheme.onPrimary
                      : colorScheme.outline.withOpacity(0.5),
                ),
        ),
      ),
    );
  }

  Future<void> _sendMessage() async {
    if (_isSending) return;

    final text = _controller.text.trim();
    if (text.isEmpty) return;

    if (!_servicesInitialized) {
      _showErrorMessage('AI services are not initialized.');
      return;
    }

    final patientId = _patientId;

    final userMsg = Message(
      id: const Uuid().v4(),
      senderId: 'user',
      senderName: _patientName,
      receiverId: 'assistant',
      content: text,
      sentAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isRead: true,
      hasAttachment: false,
    );

    setState(() {
      _messages.add(userMsg);
      _controller.clear();
      _isTyping = true;
      _isSending = true;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    try {
      final response = await _patientAiService.getPatientAiResponse(
        patientId,
        text,
      );

      if (mounted) {
        setState(() {
          _isTyping = false;
          _isSending = false;
          _messages.add(
            Message(
              id: const Uuid().v4(),
              senderId: 'assistant',
              senderName: 'Assistant',
              receiverId: patientId,
              content: response,
              sentAt: DateTime.now(),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              isRead: true,
              hasAttachment: false,
            ),
          );
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    } catch (e) {
      debugPrint("[AiAssistantPage] Error getting AI response: $e");

      if (mounted) {
        setState(() {
          _isTyping = false;
          _isSending = false;
        });

        String errorMessage = "Sorry, I couldn't process your request. ";
        if (e.toString().contains('timeout')) {
          errorMessage += "The request timed out. Please try again.";
        } else if (e.toString().contains('SocketException')) {
          errorMessage += "Network error. Please check your connection.";
        } else {
          errorMessage += "Please try again later.";
        }

        _showErrorMessage(errorMessage);
      }
    }
  }

  void _showErrorMessage(String message) {
    setState(() {
      _messages.add(
        Message(
          id: const Uuid().v4(),
          senderId: 'assistant',
          senderName: 'Assistant',
          receiverId: 'user',
          content: message,
          sentAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isRead: true,
          hasAttachment: false,
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom({bool animated = true}) {
    if (_scrollController.hasClients) {
      final scrollPosition = _scrollController.position;
      if (scrollPosition.pixels != scrollPosition.maxScrollExtent) {
        if (animated) {
          _scrollController.animateTo(
            scrollPosition.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        } else {
          _scrollController.jumpTo(scrollPosition.maxScrollExtent);
        }
      }
    }
  }
}

class _ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const _ChatBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Padding(
      padding: EdgeInsets.only(
        bottom: isDesktop ? 20 : 16,
        left: isMe && isDesktop ? 80 : 0,
        right: !isMe && isDesktop ? 80 : 0,
      ),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isMe) ...[
                CircleAvatar(
                  radius: isDesktop ? 18 : 16,
                  backgroundColor: colorScheme.primary.withOpacity(0.08),
                  child: Icon(
                    Icons.smart_toy_rounded,
                    size: isDesktop ? 20 : 18,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 20 : 16,
                    vertical: isDesktop ? 16 : 12,
                  ),
                  decoration: BoxDecoration(
                    color: isMe
                        ? colorScheme.primary
                        : colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomLeft: isMe
                          ? const Radius.circular(20)
                          : const Radius.circular(4),
                      bottomRight: isMe
                          ? const Radius.circular(4)
                          : const Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    message.content,
                    style: TextStyle(
                      color: isMe
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                      fontSize: isDesktop ? 16 : 15,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 6,
              left: isMe ? 0 : (isDesktop ? 46 : 42),
            ),
            child: Row(
              mainAxisAlignment: isMe
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DateFormat.jm().format(message.sentAt),
                  style: TextStyle(
                    color: colorScheme.outline,
                    fontSize: isDesktop ? 12 : 11,
                  ),
                ),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.done_all_rounded,
                    size: isDesktop ? 16 : 14,
                    color: message.isRead
                        ? colorScheme.primary
                        : colorScheme.outline.withOpacity(0.5),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Padding(
      padding: EdgeInsets.only(
        bottom: isDesktop ? 20 : 16,
        right: isDesktop ? 80 : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: isDesktop ? 18 : 16,
            backgroundColor: colorScheme.primary.withOpacity(0.08),
            child: Icon(
              Icons.smart_toy_rounded,
              size: isDesktop ? 20 : 18,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 20 : 16,
              vertical: isDesktop ? 16 : 12,
            ),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: isDesktop ? 22 : 20,
                  height: isDesktop ? 22 : 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Analyzing medical records...",
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: isDesktop ? 15 : 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

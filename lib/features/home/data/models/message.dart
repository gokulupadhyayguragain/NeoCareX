class Message {
  final String id;
  final String senderId;
  final String senderName;
  final String receiverId;
  final String content;
  final bool isRead;
  final bool hasAttachment;
  final DateTime sentAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Message({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.receiverId,
    required this.content,
    this.isRead = false,
    this.hasAttachment = false,
    required this.sentAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json['id'] as String,
    senderId: json['senderId'] as String,
    senderName: json['senderName'] as String,
    receiverId: json['receiverId'] as String,
    content: json['content'] as String,
    isRead: json['isRead'] as bool? ?? false,
    hasAttachment: json['hasAttachment'] as bool? ?? false,
    sentAt: DateTime.parse(json['sentAt'] as String),
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'senderId': senderId,
    'senderName': senderName,
    'receiverId': receiverId,
    'content': content,
    'isRead': isRead,
    'hasAttachment': hasAttachment,
    'sentAt': sentAt.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  Message copyWith({
    String? id,
    String? senderId,
    String? senderName,
    String? receiverId,
    String? content,
    bool? isRead,
    bool? hasAttachment,
    DateTime? sentAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Message(
    id: id ?? this.id,
    senderId: senderId ?? this.senderId,
    senderName: senderName ?? this.senderName,
    receiverId: receiverId ?? this.receiverId,
    content: content ?? this.content,
    isRead: isRead ?? this.isRead,
    hasAttachment: hasAttachment ?? this.hasAttachment,
    sentAt: sentAt ?? this.sentAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}

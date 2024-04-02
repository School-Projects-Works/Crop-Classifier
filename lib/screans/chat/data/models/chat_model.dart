class ChatModel {
  final List<Candidate> candidates;
  final PromptFeedback promptFeedback;

  ChatModel({required this.candidates, required this.promptFeedback});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      candidates: (json['candidates'] as List)
          .map((candidateJson) => Candidate.fromJson(candidateJson))
          .toList(),
      promptFeedback: PromptFeedback.fromJson(json['promptFeedback']),
    );
  }
}

class Candidate {
  final Content content;
  final String finishReason;
  final int index;
  final List<SafetyRating> safetyRatings;

  Candidate({
    required this.content,
    required this.finishReason,
    required this.index,
    required this.safetyRatings,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      content: Content.fromJson(json['content']),
      finishReason: json['finishReason'],
      index: json['index'],
      safetyRatings: (json['safetyRatings'] as List)
          .map((ratingJson) => SafetyRating.fromJson(ratingJson))
          .toList(),
    );
  }
}

class Content {
  final List<ContentPart> parts;
  final String role;

  Content({required this.parts, required this.role});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      parts: (json['parts'] as List)
          .map((partJson) => ContentPart.fromJson(partJson))
          .toList(),
      role: json['role'],
    );
  }
}

class ContentPart {
  final String text;

  ContentPart({required this.text});

  factory ContentPart.fromJson(Map<String, dynamic> json) {
    return ContentPart(text: json['text']);
  }
}

class SafetyRating {
  final String category;
  final String probability;

  SafetyRating({required this.category, required this.probability});

  factory SafetyRating.fromJson(Map<String, dynamic> json) {
    return SafetyRating(
      category: json['category'],
      probability: json['probability'],
    );
  }
}

class PromptFeedback {
  final List<SafetyRating> safetyRatings;

  PromptFeedback({required this.safetyRatings});

  factory PromptFeedback.fromJson(Map<String, dynamic> json) {
    return PromptFeedback(
      safetyRatings: (json['safetyRatings'] as List)
          .map((ratingJson) => SafetyRating.fromJson(ratingJson))
          .toList(),
    );
  }
}

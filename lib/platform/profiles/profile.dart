class Profile {
  const Profile({
    required this.id,
    required this.displayName,
    this.avatarUrl,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] as String,
      displayName: json['display_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
    );
  }

  final String id;
  final String displayName;
  final String? avatarUrl;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'display_name': displayName,
      'avatar_url': avatarUrl,
    };
  }
}

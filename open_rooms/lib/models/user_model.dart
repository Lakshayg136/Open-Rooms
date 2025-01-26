class UserModel {
  final String name;
  final String uid;
  final String batch;
  final bool isAuthenticated;
  UserModel({
    required this.name,
    required this.uid,
    required this.batch,
    required this.isAuthenticated,
  });

  UserModel copyWith({
    String? name,
    String? uid,
    String? batch,
    bool? isAuthenticated,
  }) {
    return UserModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      batch: batch ?? this.batch,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'batch': batch,
      'isAuthenticated': isAuthenticated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      batch: map['batch'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, uid: $uid, batch: $batch, isAuthenticated: $isAuthenticated)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.uid == uid &&
        other.batch == batch &&
        other.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        uid.hashCode ^
        batch.hashCode ^
        isAuthenticated.hashCode;
  }
}

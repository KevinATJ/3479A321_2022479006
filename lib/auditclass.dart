class Auditclass {
  final int? id;
  final String actionName;

  Auditclass({this.id, required this.actionName});

  Map<String, Object?> toMap() {
    return {
      'id': id, 
      'actionName': actionName, 
    };
  }

  @override
  String toString() {
    return 'Auditclass{id: $id, actionName: $actionName}';
  }
}



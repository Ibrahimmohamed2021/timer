class Task {
  int? id;
  final String taskName;
  bool isDone;
  DateTime? doneTime;
  String? autoTimer;

  Task({required this.taskName, this.isDone = false, this.id, this.doneTime, this.autoTimer});


factory Task.fromMap(Map<String, dynamic> data){
  return Task(
     taskName: data['task_name'],
     isDone: data['is_done'] == 1 ? true : false,
     doneTime:
      data["done_date"] == null ? null :DateTime.parse(data["done_date"]),
    id: data['id'],
    autoTimer:
    data["auto_timer"] ,
  );
}
Map<String, dynamic> toMap() {
  return {
    "task_name": taskName,
    "is_done": isDone == true ? 1 : 0,
    "done_date": doneTime != null ? doneTime!.toIso8601String(): null,
    "id": id,
    "auto_timer": autoTimer ,
  };
}
}
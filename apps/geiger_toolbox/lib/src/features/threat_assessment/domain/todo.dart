// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conversational_agent_client/conversational_agent_client.dart';

class Todo {
  Todo({required this.offering, this.done = false});

  final Offering offering;
  final bool done;

  @override
  String toString() => 'Todo(offering: $offering, done: $done)';

  Todo copyWith({
    Offering? offering,
    bool? done,
  }) {
    return Todo(
      offering: offering ?? this.offering,
      done: done ?? this.done,
    );
  }
}


import 'package:hive/hive.dart';
part 'pass_model.g.dart';

@HiveType(typeId: 0)
class PassData{
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String addDetails;

  @HiveField(5)
  final String lastUpdate;

  PassData({
    required this.title,
    this.username = '',
    required this.password,
    this.email = '',
    this.addDetails = '',
    required this.lastUpdate
  });
}
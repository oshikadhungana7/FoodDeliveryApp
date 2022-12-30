import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id(assignable: true)
  int uId;
  String fname;
  String lname;
  String gender;
  String email;
  String password;

  User(this.fname, this.lname, this.gender, this.email, this.password, {this.uId = 0});
}

var testUser = { 'username':'party_rabbit' };

Future login() async {
  return Future.delayed(Duration(seconds: 2), () => testUser);
}
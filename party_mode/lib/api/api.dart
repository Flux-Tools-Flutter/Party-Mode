var testUser = { 'username':'party_rabbit' };

login() async {
  return Future.delayed(Duration(seconds: 2), () => testUser);
}

setPartyState(String partyState) {
  return Future.delayed(Duration(seconds: 2), () =>  partyState);
} 

final partyingFriends = [
  {
    'username': ' Buster Joselyn',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 10)).toString(),
  },
  {
    'username': ' Jacqui Avaline',
      'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 12)).toString(),
  },
  {
    'username': ' Vance Hank',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 13)).toString(),
  },
  {
    'username': ' Foster Harper',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 20)).toString(),
  },
  {
    'username': ' Dawson Ronald',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 40)).toString(),
  },
  {
    'username': ' Brittani Heather',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 50)).toString(),
  },
  {
    'username': ' Marion Philis',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 60)).toString(),
  },
  {
    'username': ' Harland Haydn',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 70)).toString(),
  },
  {
    'username': ' Lee Diann',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 70)).toString(),
  },
  {
    'username': ' Clare Haze',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 70)).toString(),
  },
  {
    'username': ' Franklin Ronny',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 70)).toString(),
  },
  {
    'username': ' Ernestine Jensen',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 70)).toString(),
  },
  {
    'username': ' Harriette Doris',
    'last_time_seen_partying': DateTime.now().subtract(const Duration(minutes: 70)).toString(),
  },
];

Future<List> getPartyingFriends() async {
  return Future.delayed(Duration(seconds: 2), () => partyingFriends);
}
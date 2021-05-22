# Party Mode - Flutter State Management Demo

Finds out who of your friends is partying right now!

## Detecting Party

The user can click the "Party Mode" button at any time to let his friends know that he is partying

The App analyses user location and sensors data to calculate a probability of the user being partying and show a notification asking the user if its time to party

App detects and store places where the user is normally nor partying or partying

User can click send "party vibes" with the Party Vibes button to refresh its party state and alert friends that he is still on "party mode"

App tries to predict user behaviour based on all user data

Data sources

- Party Mode Button
- Party Vibes Button (Dance, Beer, Smoke, eggplant, beach, etc)

## Partying Friends

App shows a list of friends who are partying right now in an order based on the last time seen partying, last party vibe sent and distance from your current location

User can click on a friend to send a Party Vibe to that user

## Acceptance Features

- [ ] V1 - MVP
- [ ] User is able to login/register
- [ ] User is able to set/unset himself of Party Mode
- [ ] User is able to see his Partying Friends
- [ ] User is able to change his nickname and logout in Settings
- [ ] User is able to see time of party activation and distance of his partying friends

- [ ] V2 - Party Vibes
- [ ] User is able to send Party Vibes to all of his friends
- [ ] User is able to send Party Vibes to individual friends
- [ ] User is able to recive Party Vibes

- [ ] V3 - Party Behaviour
- [ ] App is able to track user location
- [ ] App is able to suggest start Party Mode action

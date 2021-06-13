# Party-Mode

Find your partying friends 🥳

This is a showcase app for flutter flux tools, an investigation on state management on flutter and the laboratory to develop something better, IMHO all the state management solutions suck, we need something better so lets build it :)

Knowing who of your friends is currently doing some social activity is a labor intensive and attention consuming activity, in order to know if one of your friends or contacts is the mood for a social activity you need to be constantly in contact with everyone, scrolling miles of facebuk and instogram feeds, looking at whatsopp statuses, etc. I just wanna know if someone wants to hangout right now so party mode was born

This app allows you to set your state as "partying" or "chilling" and inform to all of your contacts which are members of party mode that you are partying, at the same time it gives you a list of the friends that are partying, the distance from your location (whiout actually giving you their location) so you can know they are in a party mood or "party mode" and hang out with them 🕺

## Docs

[Docs](./docs/README.md)


## MVP

The minimun amount of work to make something usable, very resource and data intensive

- [ ] Flutter App using provider
    - [ ] Register/Login using phone number and nickname
    - [ ] Request contacts access
    - [ ] First time contacts upload
    - [ ] First time GET friend statuses
    - [ ] Pulling of friends statuses every x seconds
    - [ ] Party Mode status setting
    - [ ] Logout
    - [ ] Update nickname
- [ ] Server
    - [ ] Docker Server and deployment scripts
    - [ ] User Service -  Register/Login
    - [ ] User Service -  Party status update
    - [ ] User Service - Logout
    - [ ] Contacts Service -  PUT contacts
    - [ ] Contacts Service -  GET all friend statuses (heavy op)
    - [ ] Contacts Service - UPDATE contacts
- [ ] MongoDB
- [ ] Redis
- [ ] PostgreSQL

Yeah I know I'm mixing features and implementation details here ¯\_(ツ)_/¯

## Beta

- [ ] Contact changes are updated by pushing differences on the contact list instead of the full list
- [ ] Contact statuses updated are pushed to the app one by one on the background instead of reloading the full statuses list
- [ ] A bit of UX and Design
- [ ] Get user location and calculate distance from friends

## V1 (Hopefully this can be a community managed app some day)

- [ ] Send party vibes to one, many or all friends
- [ ] Set your party vibe
- [ ] Bitcoin donations
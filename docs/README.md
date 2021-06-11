# Party Mode MVP Architecture

## Servers

We want to squeeze everything into a 5USD/Month server with Docker

- nginx - router
- user_service(node.js) - Registration, Authentication, party status updates
- contacts_service(node.js) - CRUD user contacts, get contacts updates
- mongo - main db
- postgre - user contacts matching database
- redis - sessions and probably not caching

```txt
                                               +-------------------+     +--------------------+
                                               |                   |     |                    |
                                               | User Service      |     | MongoDB            |
                                               |                   |     | (MainDB)           |
+-------+     +----------+     +---------+     |                   |     |                    |
|       |     |          |     |         |     +-------------------+     +--------------------+
|  App  |     |  Cloud   |     |  NginX  |
|       |     |          |     |         |
+-------+     +----------+     +---------+     +-------------------+     +--------------------+
                                               |                   |     |                    |
                                               | Contacts Service  |     | PostgreSQL         |
                                               |                   |     | (Contact Matching) |
                                               |                   |     |                    |
                                               +-------------------+     +--------------------+
```

Both services have access to both databases and are public

will it fit in 1GB of RAM? o.O

In the future we could create a micro cloud with raspbery PIs and kubernetes to keep hosting pricing to a minimun :p

## Signup & Login

The user is able to signup with its phone number and a username, the signup and login endpoints are the same, if an already registered user use the signup/login endpoint it will just create a new session and override the current username (which is just a nickname and is non unique on our db)

Currently there is no SMS verification so any user is able to signup/login with any phone number, since we don't ask for any personal data, this shouldn't be a problem at least for the MVP

Options for SMS verification in the future:
- Use Twilio to validate phone numbers 900usd/10k-signups
- Use a phone number validation provider using whatsapp
- Login as not_verified and ask the user to send a message to another user which is not in contact list, when user not in contact list receives sms validates the phone number of this user, kind of a decentralized sms verification system, it would be way better to send the message from another active phone to user but it seems that sending sms messages in the background is not possible for obvious security reasons, price of 10k auths using Twilio authy is 900 USD
- Use a regular phone number to receive the text messages and validate them ourselves
- Hack whatsapp web to be able to read messages programatically

The verification & authentication service is going to live in its own repository, I've re-written the same thing so many times that if I have to do it again I'm gonna change my career to chef make cakes of computers and murder them horribly with a knife, the server its going to use the repository as a library and instanciate the auth system in the node.js user service, in the future it could live on its own service

Is there any open source auth lib/service we could use? 
https://supabase.io/docs/guides/auth ? 
https://github.com/nhost/nhost ?

It seems that there is no way to configure any of these systems to create an authentication system like the one we need, going off on a tangent these firebase clones does not seem to be very flexible on its use cases, they may allow you to boot an MVP super quickly but you'll hit a lack of capabilities very fast and start cutting or modifiying your app behaviour to adapt to these systems, not sure how useful they can be for real proyects, maybe a GUILess open source firebase where you still have to code some parts of the system and use the preexisting services as the building blocks for your code would be a better solution[TODO_move_this_to_somewhere_else]

# Contacts Service

The contacts service takes the user contacts, matches it with registered users, and creates a user_contact table of relationships, it mantains the table updated whenever user or contacts changes on the system and maintains a list of contact statuses changes for each user

Is there a better database for doing this?

TODO: Check neo4j
https://neo4j.com/developer/kb/performing-match-intersection/
https://github.com/OfirKP/Whatsapp-Net

TODO


dotplus
=======

http://dotplus.io

Environment setup
-----------------

* Setup app with Pow. Because of the heavy use of subdomains, I don't think there is another way to run the app.
* Create `/config/application.yml` file with the following:

```yaml
---
TWITTER_KEY: YOUR_TWITTER_KEY
TWITTER_SECRET: YOUR_TWITTER_SECRET
```

* Run `rake db:seed`

TODO
----
* Nametags
* Show events on profiles
* Email notifications
* Post-event page (way to follow people after event)
* embed.ly integration

Doesn't need to be done until after an event
* In admin, be able to mark attendees that they came

Maybe
* Comments on wall posts (maybe)

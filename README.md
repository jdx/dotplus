dotplus
=======

http://dotplus.io

Environment setup
-----------------

* Simply setup app with Pow or see the custom DNS settings steps below
* Create `/config/application.yml` file with the following:

```yaml
---
TWITTER_KEY: YOUR_TWITTER_KEY
TWITTER_SECRET: YOUR_TWITTER_SECRET
```

* Run `rake db:seed`

Custom DNS setup
----------------

* **SKIP THIS IF USING POW**
* In terminal open up the hosts file like so ```sudo vim /etc/hosts```
* Add the following entries

```
127.0.0.1 sf.dotplus.dev
127.0.0.1 la.dotplus.dev
127.0.0.1 seattle.dotplus.dev
```

* Caveat: you will have to append the port [3000] unlike the Pow setup

TODO
----
* Emails for admins when users submit talks
* Emails for wall post updates
* Show events on profiles
* Email notifications
* Post-event page (way to follow people after event)
* embed.ly integration

Doesn't need to be done until after an event
* In admin, be able to mark attendees that they came

Maybe
* Comments on wall posts (maybe)

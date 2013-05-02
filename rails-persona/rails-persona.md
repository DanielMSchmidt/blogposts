Easy, secure and user-friendly authentication with Persona in Rails
===================================================================

Why persona?
------------

Today I would like to task about Mozilla Persona, which is a great way to improve your authentication.
You may say: *"Why should I, Devise or Sourcery handle the whole logic and I don't have to care about anything"* The answer is **for your users!*** The reasons are simple:

* **Don't confuse the user**<br />
We all know how many ways there are to authenticate to a website, but the most annoying is to be forced to register and choose a password. Of course it has to be chosen under such constrains, which make it impossible to remember. This [xkcd-comic](http://xkcd.com/936/) sums it up pretty much.

* **Don't confuse the developer**<br />
There are a bunch of authentication gems, all pretty simple, but supporting different technologies (OAuth, Facebook, Twitter, ...) and the devil lies in the detail as you know. Mixing all these types of users (Your own, Facebook, ...) may cause some problems from time to time.

* **Dont't scare the user**<br />
Giving away your email address and using the same (or an variation of the same) password to many services you don't trust can scare users away from yours.

* **Dont't scare the developer**
<br />![There are too much login possibilities](http://i.qkme.me/3u7r1n.jpg)


Persona gives you the possibility to address all these problems which just one simple tool. It's **trusted** (because Mozilla is one of the most trustworthy brands in the world) and it's **universal** (users can simply use their mailaccount, which they always use).

To the rails
------------
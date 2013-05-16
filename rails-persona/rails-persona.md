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

I start with a basic rails app, which has a home controller with an index and secret action. I want to provide a login which gives you access to the secret page and I would like to have additional information saved for the user.
<br><br>
To start you have to add the persona library to the bottom of your application template:
<br>
  **app/views/layouts/application.html.erb**

    <script src="https://login.persona.org/include.js"></script>

As the IE's compatibility mode breaks persona you also have to add this line to your header

    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
<br>
The next step is to attach login handlers to our login / logout elements.

    var signinLink = document.getElementById('login');
    if (signinLink) {
      signinLink.onclick = function() { navigator.id.request(); };
    }

    var signoutLink = document.getElementById('logout');
    if (signoutLink) {
      signoutLink.onclick = function() { navigator.id.logout(); };
    }

To style them in the persona style you should add their [design](https://developer.mozilla.org/de/docs/persona/branding), what you should do, so your customers know how they are logged in and to help persona getting more and more common.
<br><br>
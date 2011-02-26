# About RMU-Map

This is going to be a simple app that fetches tweets from [Ruby Mendicant
University](http://university.rubymendicant.com/) Students. It will use 
geolocation to then put those tweets on a Google Map & display it on a page. 
The idea is to do this in or as close to realitime as possible. Since people 
may not necessarily geolocate their tweets, I might default to what location 
they have listed on Twitter but the basic idea is to see RMU activity on the 
map.

It's a part of the Front End Web Development alumni course I am taking but is
also going to be my therapy for recovering from VBA programming at work.

# To-Dos

## Must Haves
* Get the tweets from users
* Get the geolocation of the tweet and if that's not available, the default
  location of the user. If both are unavailable, we can't use the tweet.
* Get the avatar of the user
* Show them on the map

## Nice to Have
* It would be nice to have more than tweets be the activity shown on map. One
  thing that would be cool would be commits on GitHub as another activity.

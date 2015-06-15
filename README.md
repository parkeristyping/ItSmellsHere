# It Smells Here

[Itsmellshere](http://www.itsmellshere.com) is an app for reporting the location of smells. Here's how it goes down:

1. User tweets at @itsmellshere with location services enabled, or with a literal "Lat:<some latitude>, Lng:<some longitude>" string in their tweet

2. That tweet is added to our database of smells and plotted on the map at [itsmellshere.com](http://www.itsmellshere.com)

3. On [itsmellshere.com](http://www.itsmellshere.com), users can browse tweet content and locations

The site works using a Ruby Twitter bot (<a href="https://github.com/parkeristyping/smellbot"> source code</a>) that establishes a streaming connection with the Twitter API and posts to a Rails-powered site when it receives mentions in tweets with location data, which subsequently adds the tweets to a database.</p>

When visited, the Rails site plots the recent tweets in the database on a map and posts any new smells in real-time using the <a href="https://github.com/websocket-rails/websocket-rails">WebSocket-Rails</a> gem. The map is created with the Google Maps JavaScript API and incorporates some dynamic display features, such as highlighting tweets and points on the map when clicked and only displaying the text of tweets currently in the map bounds.

## Screenshot

![screenshot of itsmellshere map](https://raw.githubusercontent.com/ivalentine/ItSmellsHere/master/readme_screenshot/itsmellshere%20screenshot.png)

## Authors

It Smells Here was developed at The Flatiron School by Parker Lawrence, Evan Schrager, and Ian Valentine.

## License

Itsmellshere is MIT Licensed. See LICENSE for details.
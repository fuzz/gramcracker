**Part 1**
Let's build a simple instagram. 

- There's no auth, you can just write your handle to "log in." (type in "Jon", press enter and now i'm "@Jon"). 
- You can then post an image with a description ("this is a cool photo"). That post goes into a unique URL (sampleapp.io/jon/4), which you can share by copying the URL. 
- You can like a photo by pressing a button. 
- At the bottom of every post, there's an email submission box that builds an email list for our app. 
- Finally, there's a simple reverse chronological feed of all the posts with just the images (no author or description in the feed). Feed is 3 columns and infinitely scrollable, nothing fancy.

**Part 2**
I want to know who's getting our app the most likes and email sign ups. 
- Please create a dashboard in another section of the website that shows how many overall likes and email sign ups I'm getting from a specific "user" sharing (@Jon: 35 likes, 4 sign ups, @Allie: 40 likes, 10 sign ups). Host on heroku/beanstalk for easy testing.

**Part 3**
(Implement or explain how you may implement.)
- Seed the app with 1,000 users, 1,000 posts (whatever is hackiest way, don't spend too much time on making images interesting. feel free to use https://picsum.photos or https://placekitten.com), 10,000 cumulative likes (with an interesting distribution) programmatically. Please include this script. Are there more efficient ways to do this?
- Create a second tab (in addition to the first reverse chronological feed) that sorts the videos by most "relevant" (in a subjective mix of likes and recency. any other signal you can use within the scope of the problem?)


Any other notes on how to make this app awesome and reliable is welcome but not required.

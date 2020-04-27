# Gramcracker

## Notes

* Read through spec, design database models, routes, write email with questions -- 15m
* Write and test script to automatically set up new Rails projects the way I
  like so I don't flail around on the screencast looking at the READMEs of
  various gems for their setup instructions, resolve node.js issues -- (30m)
* Download & install Loom--wouldn't run, try screen recording with my old
  version of ScreenFlow--said it was working but no video produced, reboot and
  futz around trying to get those to work, discover macOS can now record video
  of screens but there's no audio, give up -- (30m)
* Read Active Storage docs, set up AWS buckets, configure Active Storage, add
  AWS creds, install ImageMagick, generate Post scaffold, verify image uploads
  are working, realize this would have been the most tedious screencast ever -- 1h
* Add EmailSignup and Like models, connect up all the model relationships -- 5m
* Add like feature -- 10m[1]
* Add email signup feature, having trouble focusing, get out into the weeds
  with simple_form a bit, decide it's time for a break -- 35m[1]
* Add Dashboard feature -- 5m to code, 5m stepping on singular resource routing
  rakes
* Add user seeds -- 2m to code, 5m poking around faker gem
* Add post seeds -- 5m to install down gem and code, 5m running the job before
  I realized I'd forgotten to save the posts, 8m taking coffee break waiting for job to complete before deciding it was going to be a while and moving on to Like seeds
* Coming up with an interesting likes distribution was the most fun part of
  this exercise for me. I realized once the job started I hadn't limited it to
  10,000, but I decided it was fine as long as there are at least
  10,000 (dev run produced 89,788). This could be improved by making a few
  users "influencers" -- 10m
* Went ahead and added influencers -- 2m
* Configure app for deploy -- 1m
* Updates to server image to get the latest Ruby and Node playing nice -- (1hr) [2]
* Troubleshooting client-side SSL issues with the Down gem while trying to run
  db/seeds.rb in production -- (1.75hr) [2]
* Hit asset pipeline and active storage issues in production, decide to call it a night -- 30m
* Fix asset pipeline and active storage in production -- 10m
* Implement Popularity: set up Redis, Sidekiq, ActiveJob, ActiveJob::Scheduler
  Add popularity column to Posts
  Every hour the 100 Posts from the past 30 days with the most likes are
  assigned an integer popularity score--currently it is likes + 2x email signups
  Every night posts older than 30 days have their popularity set to 0
  Popular posts are ordered by popularity for display
  Resolve Sidekiq issues -- 30m
* Use Bootstrap's .container-fluid to tile Posts -- 5m
* Set up infinite scroll -- 30m
* Resolve issues with production assets, popularity queries, OpenSSL client
  certs (again but affecting a different library that wasn't mad yesterday) and
  the activejob-scheduler gem -- (45m)

[1] Had just finished working 10 hours--this has been one heck of a week!
[2] I am both working on a new configuration management system and use FreeBSD.
It's the DevOps version of riding a fixie.

Times in (parentheses) weren't part of building the app.

## Known Bugs

* `/posts/popular` is not infinite scrolling correctly, should be an easy fix
* the `repeat` macro from the `activejob-scheduler` gem isn't loading correctly

## Improvements

* Tests
* Validation of email in signups
* Support for non-square photos
* Set up CORS for direct image uploads
* Set up flash notices for email signup, etc
* Seed distribution could be more interesting
* Don't show email signup for signed-in users
* Column ordering for dashboard

## Questions

Q: Seed the app with 1,000 users, 1,000 posts, 10,000 cumulative likes (with an interesting distribution) programmatically. Please include this script. Are there more efficient ways to do this?

A: For this one-time job the appropriate measures of efficiency are programmer time
   and ease of maintainability; I'd say this is pretty solid. The script is in
   `db/seeds.rb`

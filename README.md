This app is an incomplete attempt to incorporate a feature into
Canvas-hosted courses in which students in the same team (group) can
provide confidential ratings for each other.

It also serves as an example of constructing an LTI Service with which
a session can be initiated via a properly constructed `POST` (that
comes from Canvas) after which the service knows the student's
identity, can retrieve other information in the student context using
the Canvas API, etc.

# Setup

Create a file `config/application.yml` that includes the following:

* `canvas_host`: Canvas host and endpoint that accepts LTI requests
* `canvas_api_key`: Canvas API key



the key model is Session, which is responsible for initiating a session with canvas (bcourses).  this app is structured as an "LTI service", which means its view of the world is that it is "launched" by a special HTTPS POST request that originates from canvas when the student is already logged in (in this case, it's when the student clicks on a homework assignment that has been configured to use an external LTI service when the student tries to access the assignment).

it's been awhile but i BELIEVE the idea is that (looking at routes.rb) a post to '/' is that magic POST, and the RatingsController#new action (which receives the POST) uses params in the post request (supplied by canvas) to figure out the student's name, course ID & name, etc (in Session#initialize).

you will need a canvas api key and setup a course to play around with this; they have a sandbox environment specifically for this purpose or you can setup a bogus assignmnet in the real cs169 course, though you'll still need an API key for the LTI service.

the app expects to find a config/application.yml containing values for canvas_host and canvas_api_key.  i will put all this in a README.md - the original idea was this would be a way for students to rate their teammates directly from within bcourses, since it knows the members of the groups etc, but i never finished it.  in real life, this logic should be incorporated into the ESaaS Engagements app as a separate controller, so that the app can receive HTTP requests either from users via the web interface or from an LTI client like canvas to then serve its UI through there.

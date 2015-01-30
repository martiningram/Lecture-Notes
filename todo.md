# TODO LIST

Things I would like to get done.

* Get vim set up very nicely
	* See how I can make notes work very nicely
		* Check out the notes plugin
		* In particular, move bullet points up and down (priority)
		* Maybe give items priorities and filter by these?
	* Make `make` able to run asynchronously so that I don't have to wait
	(there is a link somewhere)
	* Work out how to use git nicely (like magit in emacs)
	* find quick way to navigate project in vim (based on the git project).
	This is what projectile would have been in emacs.
	* Find out how to use visual mode effectively
	* Find out how to use the clipboard properly
	* auto-complete for python, C++

* Tennis:
	* produce object-oriented ball tracking framework, probably using
	Strategy pattern + any others that may be of interest
		* Read Gamma for hints
		* Draw a quick UML diagram
		* Re-write project
	* put things into git nicely
	* use basic OpenCV functions to produce some sample output
		* find a reasonably nice way to encode several ball candidates
		per frame in a text file
		* try using the simple blob detector and other functions
		provided by OpenCV
		* try using my basic ellipse fit to produce candidates
	* go through my logic for each part of the new object-oriented structure
	and see whether it makes sense. Correct if necessary.
		* In particular, is my xor-method working in the way it should
		* Is it worth trying xor using "negative" values, as suggested
		by Silvia? Or is my current approach maybe safer?
	* After implementing the basic logic, check papers for more info on
	viable approaches
	* Also, read up on Kalman filter to improve detection further
	* In general, think about how to use the trajectory data
	* Read through the previous group's code to see what they were doing and
	what we may be able to use
	* Set up cmake using George's build stuff to make sure I can easily
	compile things cross-platform
		* Probably have to setup OpenCV properly for this to work.

* Logic-based learning:
	* Finish Tutorial 1 _mostly done_
	* Read through next set of notes _ASAP_
	* Do Tutorial 2 as much as possible

* IDAPI:
	* Go through coursework 1 to make sure it's OK:
		* Format things nicely
		* Make sure everything's clear
		* Make sure everything's the way they want it
		* Optional: Read up on python to see whether there are nicer
		ways of doing things
	* Read through the notes, particularly for Lectures 4 and 5, and make
	sure I understand them
		* Check whether lecture 5 is on panopto and watch if poss
		* Potentially watch lecture 4 again to understand the multiple
		parent thing
	* Coursework 2:
		* Make sure to cover the case of independent nodes
		* Make the results print nicely
		* Beautify and clean up my hand-drawn graph somewhat and make it
		a little clearer how I produced it

* Databases:
	* Read through slides to make sure I understand them

* Algorithms:
	* Have a quick look through what we've covered so far.
	* Watch latest lecture on Panopto.
	
# Order

1. LBL
2. Databases
3. Tennis

IDAPI has to be done before Monday; some time during the weekend. Algorithms:
have a quick look today.

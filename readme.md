Scripts to set up and interact with my [cmus](https://github.com/cmus/cmus) library:

* add all my music
* remove duplicate files
* annotate longer recordings with more detailed 'segments'

TODO

* this doesn't remove all duplicate songs: different files but with same length and metadata aren't caught by `fdupes`. It'd be great to fingerprint all songs but that's a lot more work?

---

# Commands

## `current-mark`

If the currently playing track has a marks file, check to see if it's
currently playing within a marked segment, and if so,
print the name of that mark

## `list`

Show the named segments

get playing track and set marks file

## `loop`

Loop one segment repeatedly
given an argument, find the matching segment to loop
otherwise loop the first segment

## `play-the-good-stuff`

Play through each segment, skipping everything in between

## `set-mark`

Set a mark with whatever arguments at the current time

## `set-mark-and-wait-for-end`

Set a mark, then wait for a keyboard event to end the segment with an 'end'
mark.

When given the argument `--interactive` it will ask for a track name and
wait.  When the track ends, it will start over again to make setting marks
through a long recording easier.

## `show-marks`

Show the file where marks for the currently playing track belong

get playing track and set marks file

## `skip`

start playback from a matching named segment 

## `sleep-until-play-resumes`

When `cmus` is paused, this will sit and wait until playback resumes so other
scripts can adjust

## `snip`

Cut long track with a marks file into 'snips' and put them into

    _snips/<artist>/<trackname>/<segment names>.mp3

Also joins all the segments into a `.../joined.mp3`
Operates on the currently playing track

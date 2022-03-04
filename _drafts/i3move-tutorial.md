---
layout: post
last_modified_at: 2022-03-04 09:03:19 UTC
---

How to use the [i3b project's](https://github.com/dmbuce/i3b) i3move utility.

1. TOC
{:toc}

### Getting Started

If you want to get up and running quickly with i3move,
refer to the manual.
[The examples section](https://dmbuce.github.io/i3b/i3move.1.html#EXAMPLES)
near the bottom shows how to generate a default config and bind some keys using i3.
That's really all you need to get started.

However, there is a lot going on in the default config.
If you open it up with a text editor, you may find yourself wondering things like:
What the heck does `--inside-distance w` mean?
Why `--small-distance =` ?

The various options interact with each other
in a lot of ways to drive i3move's default behavior,
so rather than try to explain everything all at once,
let's take a look at a simplified example
and work our way towards a more complicated config.

If you'd like to play along, you should install i3move
from the [i3b project](https://github.com/dmbuce/i3b)
if you haven't already.
You should also set up i3 keybindings as explained in
[the examples section](https://dmbuce.github.io/i3b/i3move.1.html#EXAMPLES)
of the man page.

Then, generate a config with some options changed from the defaults:

	i3move --gen \
	--inside-distance 30px \
	--outside-distance 30px \
	--small-distance 0px \
	--large-distance 0px \
	--threshold 0 \
	--no-clamp \
	--no-snap \
	--no-hide \
	--no-compound-display
	--passthru \
	> ~/.config/i3move

You should see i3 flip over to a temporary workspace,
then launch, manipulate, and close an `i3-sensible-terminal`
before returning to your original workspace.
i3move does this in order to
calculate the thickness of i3 title bars, borders, and such.

To explain the command above,

* `i3move --gen` prints a config
* `--inside-distance 30px --outside-distance 30px` makes i3move move a window by 30 pixels no matter where on the screen it is
* `--small-distance`, `--large-distance`, and `--threshold` don't do anything just yet, more on those later
* The various `--no-*` options disable behaviors such as clamping, snapping, hiding, etc.
* `--passthru` tells i3move that it should move tiled windows with i3's builtin `move` command in addition to floating ones
* `> ~/.config/i3move` stores `i3move --gen` output into our config

The end result is that a key bound to e.g. `exec i3move up` in i3's config behaves
as if it was bound to i3's internal `move up 30px` command.
Tiled windows will move in the usual way
and floating windows will move in increments of 30 pixels.

### Titles, Borders, and Margins

If you open up the `~/.config/i3move` file we created,
at the top you'll see the `--title`, `--border`, and `--margins` settings
that were generated based on your i3 setup.
`--title` is the thickness of the title bars on floating i3 windows,
and `--border` is thickness of the left, right, and bottom window borders.
If you have title bars disabled,
`--title` should be set to the thickness of the top window border.

`--margins` has four values, one each for the top, bottom, left, and right margins,
in that order.
We will discuss the margins in the next section.

### Clamping and Snapping

If you use i3move to move a floating window around the screen with our example config,
you'll notice that it's hard to align the window to the edge of the screen.
Let's fix that.

What we can do is set 

### Gaps and Multi-Monitor Setups

TODO: mention i3gaps config implications?
      borders defined by for_window?
      verify with kolourpaint?

### Hiding

![Example i3 desktop](https://i.imgur.com/y7kE6DS.jpg){: width="250"}

<!--
### Footnotes

[^1]: Credit goes to <user> for <whatever reasons>.
-->


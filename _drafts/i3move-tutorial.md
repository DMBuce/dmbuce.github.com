---
layout: post
last_modified_at: 2019-11-25 01:07:03 UTC
---

How to use the [i3b project's](https://github.com/dmbuce/i3b) i3move utility.

1. TOC
{:toc}

### Getting Started

If you want to get up and running quickly with i3move,
refer to the manual.
[The examples section](https://dmbuce.github.io/i3b/i3move.html#EXAMPLES)
near the bottom shows how to generate a default config and bind some keys using i3.
That's really all you need to get started.

However, there is a lot going on in the default config.
If you open it up with a text editor, you may find yourself wondering things like:
What the heck does `--inside-distance w` mean?
Why `--small-distance =`?

The various options interact with each other
in a lot of ways to drive i3move's default behavior,
so rather than try to explain everything all at once,
let's start with a simplified example
and work our way towards a more complicated config.

TODO: document installation in the README

If you haven't already, you should install i3move.
Arch users can get it by installing the
[AUR's i3b package](https://aur.archlinux.org/packages/i3b),
and on other distros you can download the script,
drop it in your `$PATH`, and make it executable.

    # set up ~/bin in your PATH if it's not already
    mkdir -p ~/bin
    export PATH="$PATH:$HOME/bin"
    echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bashrc
    
    # download and install i3move
    wget -O ~/bin/i3move https://raw.githubusercontent.com/DMBuce/i3b/master/bin/i3move
    chmod +x ~/bin/i3move

You should also set up i3 keybindings as explained in
[the examples section](https://dmbuce.github.io/i3b/i3move.html#EXAMPLES)
of the man page.
 
Now, let's generate a basic config to work from.

    i3move --gen \
    --inside-distance 30px \
    --outside-distance 30px \
    --small-distance 0px \
    --large-distance 0px \
    --threshold 0 \
    --no-clamp \
    --no-snap \
    --no-hide \
    --passthru \
    > ~/.config/i3move

### Titles, Borders, and Margins

If you open up the `~/.config/i3move` file we created,
at the top you'll see the `--title`, `--border`, and `--margins` settings
that were generated based on your i3 setup.

TODO: explain the settings, verify with kolourpaint

TODO: mention i3gaps config implications? borders defined by for_window?

![Example i3 desktop](https://i.imgur.com/y7kE6DS.jpg)

### Clamping and Snapping

### 

<!--
### Footnotes

[^1]: Credit goes to <user> for <whatever reasons>.
-->


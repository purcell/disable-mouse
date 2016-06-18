[![Melpa Status](http://melpa.org/packages/disable-mouse-badge.svg)](http://melpa.org/#/disable-mouse)
[![Melpa Stable Status](http://stable.melpa.org/packages/disable-mouse-badge.svg)](http://stable.melpa.org/#/disable-mouse)

# Disable the mouse in Emacs

Want to force yourself to use the keyboard in Emacs? Use this local or
global minor mode to suppress the default mouse behaviours.

## Installation

### Manual

Ensure `disable-mouse.el` is in a directory on your load-path, and
add the following to your `~/.emacs` or `~/.emacs.d/init.el`:

``` lisp
(require 'disable-mouse)
(global-disable-mouse-mode)
```

### MELPA

If you're an Emacs 24 user or you have a recent version of
`package.el` you can install `disable-mouse` from the
[MELPA](http://melpa.org) repository. The version of
`disable-mouse` there will always be up-to-date.

Enable `global-disable-mouse-mode` with `M-x global-disable-mouse-mode`, by using
the customisation interface, or by adding code such as the following
to your emacs startup file:

``` lisp
(global-disable-mouse-mode)
```

If you want to only disable the mouse in only a certain mode, add
`disable-mouse-mode` to that mode's hook.

### Related packages

After writing this, I found
[handoff](https://github.com/rejeep/handoff.el), which has a similar
goal, but aims for more annoyance and frivolity.


## About

Author: Steve Purcell <steve at sanityinc dot com>

Homepage: https://github.com/purcell/disable-mouse

This little library was extracted from the author's
[full Emacs configuration](https://github.com/purcell/emacs.d), which
readers might find of interest.

<hr>

[![](http://api.coderwall.com/purcell/endorsecount.png)](http://coderwall.com/purcell)

[![](http://www.linkedin.com/img/webpromo/btn_liprofile_blue_80x15.png)](http://uk.linkedin.com/in/stevepurcell)

[Steve Purcell's blog](http://www.sanityinc.com/) // [@sanityinc on Twitter](https://twitter.com/sanityinc)


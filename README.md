[![Melpa Status](http://melpa.org/packages/disable-mouse-badge.svg)](http://melpa.org/#/disable-mouse)
[![Melpa Stable Status](http://stable.melpa.org/packages/disable-mouse-badge.svg)](http://stable.melpa.org/#/disable-mouse)
<a href="https://www.patreon.com/sanityinc"><img alt="Support me" src="https://img.shields.io/badge/Support%20Me-%F0%9F%92%97-ff69b4.svg"></a>

# Disable the mouse in Emacs

Want to force yourself to use the keyboard in Emacs, and you don't
have a cat available to obstruct your trackpad? Use this local or
global minor mode to suppress the default mouse behaviours.

![Cat disabling trackpad](disable-mouse-cat.jpg)

## Installation

### Manual

Ensure `disable-mouse.el` is in a directory on your load-path, and
add the following to your `~/.emacs` or `~/.emacs.d/init.el`:

``` lisp
(require 'disable-mouse)
(global-disable-mouse-mode)
```

If you use Evil, this may be insufficient, since the keymaps for
Evil's individual states will contain bindings for mouse
events. `disable-mouse` provides a function `disable-mouse-in-keymap`
which you can use to neutralise any keymap, so Evil users might use a
snippet like the following in addition to that above:

```lisp
(mapc #'disable-mouse-in-keymap
  (list evil-motion-state-map
        evil-normal-state-map
        evil-visual-state-map
        evil-insert-state-map))
```

Note that you won't be able to restore those Evil mouse bindings by turning off
`disable-mouse-mode`. You'll need to restart Emacs instead.

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

[💝 Support this project and my other Open Source work](https://www.patreon.com/sanityinc)

[💼 LinkedIn profile](https://uk.linkedin.com/in/stevepurcell)

[✍ sanityinc.com](http://www.sanityinc.com/)

[🐦 @sanityinc](https://twitter.com/sanityinc)

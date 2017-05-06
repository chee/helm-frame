# helm frame

put helm in its own dedicated frame that pops up in the centre of the screen
be the envy of your loved ones and hide from them in the kitchen cupboards

with a property configurated emacs like this:

![emacs](https://snake.dog/s/fokit/emacs.png)

pressing <kbd>M-x</kbd> will give you, wait for it

wait for iiiiiit~

![helm-frame](https://snake.dog/s/velux/helm-frame.png)

this!

it goes away again when you are done with it

## using

when you have helm all installed sweet to the beat las vegas, stick helm-frame.el somewhere you can require it from and do:

```elisp
    (require 'helm-frame)

    (add-hook 'helm-after-action-hook '@helm-frame/delete)
    (add-hook 'helm-cleanup-hook '@helm-frame/delete)
    (setq helm-split-window-preferred-function '@helm-frame/window)
```

## contributing

sure ! fix my code ! make me cry ! open for PRs and discussion in the issues

## todo

* allow customization of:
  - window title
  - width and height
* move somewhere warm
* make some friends in the movie biz
* pay ryan gosling to breath on my skin

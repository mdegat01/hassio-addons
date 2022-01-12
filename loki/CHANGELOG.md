## What’s changed

It appears something about the `2.4.0` release of Loki made the retention policy I put in place in the default config of this addon stop working. I personally noticed it this release when Loki was taking so long to start up due to its huge index that watchdog was restarting it before it could finish (watchdog polls it every 2 minutes if you have it on).

This release fixes the retention policy so your `days_to_keep` value is honored again. If you are having trouble getting Loki working check your supervisor log for entries like this:

```
WARNING (MainThread) [supervisor.misc.tasks] Watchdog missing application response from 39bd2704_loki
```

If you see that, turn off watchdog and start Loki. Assuming it is able to get up and running then let it run for about 6 hours or so, the compactor should kick in and clean up the index by that point. After that you should be able to turn watchdog back on and proceed as normal.

And please report an [issue](https://github.com/mdegat01/addon-loki/issues) if you are still seeing issues after that or aren't able to start Loki even with watchdog off.

## 🚀 Enhancements

- Stop subtracting one from `days_to_keep` @mdegat01 (#142)

## 🐛 Bug fixes

- Fix retention by using compactor @mdegat01 (#139)
- Needs access to ssl cnf file and files in `/tmp` @mdegat01 (#140)
- Grant `rwk` access in `/tmp` to files owned by Loki user @mdegat01 (#141)
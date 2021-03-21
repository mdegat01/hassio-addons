# What's Changed

Promtail addon has now been moved to its own [repository](https://github.com/mdegat01/addon-promtail)!

This add-on is still waiting for a release of supervisor containing [this PR](https://github.com/home-assistant/supervisor/pull/2722).
Until then it should be considered alpha at best since it cannot pull all logs
from all supervisor components and HA as the documentation describes.

It is working in my manual testing using `additional_scrape_configs` so it can
be tested if you're willing to put in some effort and limit your expectations.
I'm switching my focus to fleshing out CI and testing until there's a
supervisor release with the needed functionality.

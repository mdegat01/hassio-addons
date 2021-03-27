# mdegat01's Home Assistant Add-ons

![Project Stage][project-stage-shield]
![Maintenance][maintenance-shield]
[![License][license-shield]](LICENSE.md)

A hopefully useful collection of HA add-ons made by mdegat01.

## Installation

Click this link and follow the provided directions:

[![Open your Home Assistant instance and show the add add-on repository dialog
with a specific repository URL pre-filled.][add-repo-shield]][add-repo]

Or alternatively, copy this URL and add it as a repository in the add-on store:

```txt
https://github.com/mdegat01/hassio-addons
```

## Add-ons provided by this repository

### &#10003; [Loki][addon-loki]f

![Latest Version][loki-version-shield]
![Supports armhf Architecture][loki-armhf-shield]
![Supports armv7 Architecture][loki-armv7-shield]
![Supports aarch64 Architecture][loki-aarch64-shield]
![Supports amd64 Architecture][loki-amd64-shield]
![Supports i386 Architecture][loki-i386-shield]

Loki for Home Assistant

[![Open your Home Assistant instance and show the dashboard of a Supervisor add-on.][add-addon-shield]][add-addon-loki]

[:books: Loki add-on documentation][addon-doc-loki]

### &#10003; [Promtail][addon-promtail]f

![Latest Version][promtail-version-shield]
![Supports armhf Architecture][promtail-armhf-shield]
![Supports armv7 Architecture][promtail-armv7-shield]
![Supports aarch64 Architecture][promtail-aarch64-shield]
![Supports amd64 Architecture][promtail-amd64-shield]
![Supports i386 Architecture][promtail-i386-shield]

Promtail for Home Assistant

[![Open your Home Assistant instance and show the dashboard of a Supervisor add-on.][add-addon-shield]][add-addon-promtail]

[:books: Promtail add-on documentation][addon-doc-promtail]

## Releases

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several ways to get them answered:

- The Home Assistant [Community Forum][forum]. Each add-on has a thread, I am
  [CentralCommand][forum-centralcommand] there.
- The Home Assistant [Discord Chat Server][discord-ha]. Use the #add-ons channel,
  I am CentralCommand#0913 there.

You could also open an issue here on GitHub. Note, I use a separate
GitHub repository for each add-on. Please ensure you are creating the issue
on the correct GitHub repository matching the add-on.

- [Open an issue for the add-on: Loki][loki-issue]
- [Open an issue for the add-on: Promtail][promtail-issue]

For a general repository issue or add-on ideas [open an issue here][issue]

## License

MIT License

Copyright (c) 2021 mdegat01

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-loki]: https://github.com/mdegat01/addon-loki/tree/v1.1.0
[addon-doc-loki]: https://github.com/mdegat01/addon-loki/blob/v1.1.0/README.md
[loki-issue]: https://github.com/mdegat01/addon-loki/issues
[loki-version-shield]: https://img.shields.io/badge/version-v1.1.0-blue.svg
[add-addon-loki]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=39bd2704_loki
[loki-aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[loki-amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[loki-armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[loki-armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[loki-i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[addon-promtail]: https://github.com/mdegat01/addon-promtail/tree/v1.1.3
[addon-doc-promtail]: https://github.com/mdegat01/addon-promtail/blob/v1.1.3/README.md
[promtail-issue]: https://github.com/mdegat01/addon-promtail/issues
[promtail-version-shield]: https://img.shields.io/badge/version-v1.1.3-blue.svg
[add-addon-promtail]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=39bd2704_promtail
[promtail-aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[promtail-amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[promtail-armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[promtail-armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[promtail-i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[add-addon-shield]: https://my.home-assistant.io/badges/supervisor_addon.svg
[add-repo-shield]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[add-repo]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A//github.com/mdegat01/hassio-addons
[discord-ha]: https://discord.gg/c5DvZ4e
[forum-centralcommand]: https://community.home-assistant.io/u/CentralCommand/?u=CentralCommand
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io?u=CentralCommand
[mdegat01]: https://github.com/mdegat01
[issue]: https://github.com/mdegat01/hassio-addons/issues
[license-shield]: https://img.shields.io/github/license/mdegat01/hassio-addons.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2021.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[reddit]: https://reddit.com/r/homeassistant
[semver]: http://semver.org/spec/v2.0.0.html
[third-party-addons]: https://home-assistant.io/hassio/installing_third_party_addons/
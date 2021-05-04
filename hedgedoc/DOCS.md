# Home Assistant Add-on: HedgeDoc

## Install

First add the repository to the add-on store (`https://github.com/mdegat01/hassio-addons`):

[![Open your Home Assistant instance and show the add add-on repository dialog
with a specific repository URL pre-filled.][add-repo-shield]][add-repo]

Then find HedgeDoc in the store and click install:

[![Open your Home Assistant instance and show the dashboard of a Supervisor add-on.][add-addon-shield]][add-addon]

## Database Setup

[HedgeDoc][hedgedoc] requires a MySQL database to store its data. By default
it will store its data in the [MariaDB addon][addon-mariadb]. That add-on must
be installed and running prior to start-up. You don't need any additional configuration
for this, as long as the MariaDB add-on is running this one can use it.

[![Open your Home Assistant instance and show the dashboard of a Supervisor add-on.][add-addon-shield]][add-addon-mariadb]

If you prefer you can use a remote MySQL system by filling in all the `remote_mysql_*`
options below. You must create the database and operator for HedgeDoc in advance
and HedgeDoc will need full read/write access on the specified database so it can
set up the schema and manage the data.

Please note that there is no easy upgrade path between these two options.

## ⚠ Backing up HedgeDoc

Since HedgeDoc does not store its own data, snapshots of this add-on will only
include its configuration. You will need to separately back up the data in order
to restore. If you are using the MariaDB add-on then make sure to include that
add-on in your snapshot as well. If you are using a different database then you
will need to set up your own backup process.

## Configuration

Example add-on configuration:

```yaml
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
access:
  domain: homeassistant.local
  add_port: true
  session_secret: changeme
  session_days: 30
csp_directives:
  - name: frameAncestors
    value: "'self'"
env_vars:
  - name: CMD_HSTS_ENABLE
    value: "true"
  - name: CMD_HSTS_PRELOAD
    value: "false"
log_level: info
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `ssl`

Enables/Disables SSL (HTTPS). Set it `true` to enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `access.domain`

The domain users will access HedgeDoc at. While not required, providing this is
encouraged. If omitted you will see several warnings informing you that some features
will not work. Check the [HedgeDoc docs][hedgedoc-docs] for more info.

### Option: `access.use_ssl`

If users will use SSL to access HedgeDoc. Defaults to `false`. Ignored if `access.domain`
is omitted.

### Option: `access.add_port`

If users will include the port in the URL when accessing HedgeDoc. Defaults to
`false`. Ignored if `access.domain` is omitted.

**Note**: _If `true`, HedgeDoc will expect users to access it at port 3000. It
does not support port remapping so if you map port 3000 to a different port
on the host it won't work properly. Your options here are:_

- _(Preferred) Don't expose the port, set `access.add_port` to `false` and use
  a reverse proxy (ex. [Nginx Proxy Manager][addon-npm])._
- _Expose port 3000 as port 3000 on the host, set `access.add_port` to `true`._
- _Expose port 3000 as port 443 (ssl) or 80 (non-ssl), set `access.add_port` to
  `false`._

### Option: `access.session_secret`

Used to sign session cookies. If not set a value will be randomly generated each
startup which will log out all users.

### Option: `access.session_days`

Number of days before users have to log in again.

### Option: `access.allow_email_registration`

Enable/disable the ability to sign up with an email. Defaults to `true`. Set to
`false` if you want to limit who can login to a fixed set of users. Or if you want
to only allow an [alternate login method][hedgedoc-docs-login].

### Option: `csp_directives`

Set directives for [helmet][helmet-docs] to use to configure the content security
policy. HedgeDoc itself also sets a number of defaults here so your directives
will be merged with theirs. See [their documentation][hedgedoc-docs-web-sec] for
more information.

### Option: `remote_mysql_host`

If using an external database, the hostname/address for the MySQL/MariaDB database.

### Option: `remote_mysql_port`

Only applies if a remote MySQL database is used, the port that the database
server is listening on.

### Option: `remote_mysql_database`

Only applies if a remote MySQL database is used, the name of the database.

### Option: `remote_mysql_username`

Only applies if a remote MySQL database is used, the username with permissions
on that database.

### Option: `remote_mysql_password`

Only applies if a remote MySQL database is used, the password of the above user.

### Option: `reset_database`

Set to `true` to delete and recreate the database on startup. As the data is held
within the MariaDB addon, it is not removed on an uninstall.

**Note**: _This option **only** applies if using the MariaDB add-on, it will not
try to drop a remote MySQL database. Also once the database is reset this configuration
option will be cleared automatically for the addon._

### Option: `env_vars`

This allows the setting of Environment Variables to control HedgeDoc configuration
as documented at:

<https://docs.hedgedoc.org/configuration>

**Note**: _Changing these options can possibly cause issues with your instance.
USE AT YOUR OWN RISK!_

These are case sensitive and any items set by specific configuration will take
precedence (you can see those [here][run]).

The only exception is `CMD_HSTS_ENABLE`. That is set to `false` before `env_vars`
are processed specifically so you can choose to turn it back on if you want. Setting
the HSTS header causes issues if you use the same domain for multiple applications
and not all use SSL so it is disabled by default to prevent surprise errors.

If you do enable HSTS HedgeDoc also sets `includeSubdomains` and `preload` by default.
`preload` in particular can cause browsers to add your site to a public list that
takes months to get off. Would recommend reading up on [preload][hsts-preload]
before enabling it.

#### Sub-option: `name`

The name of the environment variable to set.

#### Sub-option: `value`

The value of the environment variable to set.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several ways to get them answered:

- The Home Assistant [Community Forum][forum]. I am
  [CentralCommand][forum-centralcommand] there.
- The Home Assistant [Discord Chat Server][discord-ha]. Use the #add-ons channel,
  I am CentralCommand#0913 there.

You could also [open an issue here][issue] on GitHub.

## Authors & contributors

The original setup of this repository is by [Mike Degatano][mdegat01].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

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

[add-addon-shield]: https://my.home-assistant.io/badges/supervisor_addon.svg
[add-addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=39bd2704_hedgedoc
[add-addon-mariadb]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_mariadb
[add-repo-shield]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[add-repo]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fmdegat01%2Fhassio-addons
[addon-mariadb]: https://github.com/home-assistant/addons/tree/master/mariadb
[addon-npm]: https://github.com/hassio-addons/addon-nginx-proxy-manager
[contributors]: https://github.com/mdegat01/addon-hedgedoc/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[forum-centralcommand]: https://community.home-assistant.io/u/CentralCommand/?u=CentralCommand
[forum]: https://community.home-assistant.io/t/home-assistant-add-on-hedgedoc/296809?u=CentralCommand
[hedgedoc]: https://hedgedoc.org/
[hedgedoc-docs]: https://docs.hedgedoc.org/
[hedgedoc-docs-login]: https://docs.hedgedoc.org/configuration/#login-methods
[hedgedoc-docs-web-sec]: https://docs.hedgedoc.org/configuration/#web-security-aspects
[helmet-docs]: https://helmetjs.github.io/
[hsts-preload]: https://hstspreload.org/
[issue]: https://github.com/mdegat01/addon-hedgedoc/issues
[mdegat01]: https://github.com/mdegat01
[releases]: https://github.com/mdegat01/addon-hedgedoc/releases
[run]: https://github.com/mdegat01/addon-hedgedoc/blob/main/hedgedoc/rootfs/etc/services.d/hedgedoc/run
[semver]: http://semver.org/spec/v2.0.0

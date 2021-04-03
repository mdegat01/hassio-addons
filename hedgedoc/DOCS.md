# Home Assistant Add-on: HedgeDoc

## Install

First add the repository to the add-on store (`https://github.com/mdegat01/hassio-addons`):

[![Open your Home Assistant instance and show the add add-on repository dialog
with a specific repository URL pre-filled.][add-repo-shield]][add-repo]

Then find Loki in the store and click install:

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
session_secret: changeme
session_days: 30
log_level: info
env_vars: []
```

**Note**: \_This is just an example, don't copy and paste it! Create your own!

### Option: `ssl`

Enables/Disables SSL (HTTPS). Set it `true` to enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `session_secret`

Used to sign session cookies. If not set a value will be randomly generated each
startup which will log out all users.

### Option: `session_days`

Number of days before users have to log in again.

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
[contributors]: https://github.com/mdegat01/addon-loki/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[forum-centralcommand]: https://community.home-assistant.io/u/CentralCommand/?u=CentralCommand
[forum]: https://community.home-assistant.io?u=CentralCommand
[hedgedoc]: https://hedgedoc.org/
[issue]: https://github.com/mdegat01/addon-loki/issues
[mdegat01]: https://github.com/mdegat01
[releases]: https://github.com/mdegat01/addon-loki/releases
[run]: https://github.com/mdegat01/addon-hedgedoc
[semver]: http://semver.org/spec/v2.0.0

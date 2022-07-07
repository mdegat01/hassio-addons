## What’s changed

Big bump. Took a while because v1.10.0 of Sharry did not work with MariaDB. v1.11.0 does but it requires an updated version of MariaDB, note the breaking change below. If you want to see what is new with Sharry check out the [release notes](https://github.com/eikek/sharry/releases).

## 🚨 Breaking changes

If your database is MariaDB this addon requires MariaDB version >= 10.5.2.
If you are using the official MariaDB addon, you must be on version >= 2.5.0 of that addon.

## 🚀 Enhancements

- Update sharry from 1.9.0 to 1.11.0 @mdegat01 (#105, #99, #95)
- Dark mode! And update sharry config @mdegat01 (#106)
-  🔒 Sign add-on with Codenotary Community Attestation Service (CAS) @mdegat01 (#98)

## 🧰 Maintenance

- Ensure log level setting used for all loggers @mdegat01 (#110)
- Apparmor fixes for 1.11.0 @mdegat01 (#109)
- Fix permissions for s6 v3 and remove fix-attrs.d @mdegat01 (#101)
- Remove build layer to simplify dockerfile @mdegat01 (#103)
- Adjust apparmor for s6 v3 @mdegat01 (#107)
- Base version into build.yaml @mdegat01 (#97)

## ⬆️ Dependency updates

- Update addon base to 12.2.0 @mdegat01 (#104, #96)
- Bump mariadb-client and openjdk11-jre @mdegat01 (#94)

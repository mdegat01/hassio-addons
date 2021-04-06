Launch release! 🎉 🎉 

Seems like its ready to go so enjoy HedgeDoc for Home Assistant!

## What’s changed
## 🚨 Breaking changes

- Switch config from `mysql_*` to `remote_mysql_*` @mdegat01 (#9)

## 🐛 Bug fixes

- Remote DB test had incorrect nc path @mdegat01 (#10)

## 🚀 Enhancements

- Remove Nginx and use native SSL features @mdegat01 (#4)
- Exit if remote db is unavailable @mdegat01 (#11)
- Add watchdog and webui urls to config @mdegat01 (#13)
- Add `armhf` and `i386` to arch list @mdegat01 (#14)
- Add option for disabling email registration @mdegat01 (#15)

## 🧰 Maintenance

- Add labels to image @mdegat01 (#5)

## 📚 Documentation

- Remove my.HA buttons from generated README @mdegat01 (#3)
- Update project stage shield @mdegat01 (#12)

## ⬆️ Dependency updates

- Update base image to `9.1.6` @mdegat01 (#6)

## What’s changed

Primary change of this release is addition of a custom apparmor profile for increased security of the addon. These profiles carefully control what can and cannot be used to ensure the service does not have access to anything more then strictly necessary. I did extensive testing to ensure it works with this profile in place but I definitely didn't exhaust every possible configuration option of Sharry so its possible some advanced configurations require access to a file or capability that is now being denied.

If you encounter an issue please report it [here](https://github.com/mdegat01/addon-sharry/issues) and include details of your configuration and logs you saw.

## 🚀 Enhancements

- Add custom apparmor profile @mdegat01 (#12)

## 🧰 Maintenance

- Add docker to dependabot @mdegat01 (#17)
- Run CI nightly to check packages @mdegat01 (#19)
- Add workflow to enforce specific labels on PRs @mdegat01 (#11)

## ⬆️ Dependency updates

- Bump mariadb-client from 10.5.8-r0 to 10.5.9-r0 @mdegat01 (#15)
- Bump addons base from `9.1.7` to `9.2.0` @mdegat01 (#16)
- Bump alpine from 3.13.4 to 3.13.5 in /sharry @dependabot (#18)





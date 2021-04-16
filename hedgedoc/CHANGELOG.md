Primary change of this release is addition of a custom apparmor profile for increased security of the addon. These profiles carefully control what can and cannot be used to ensure the service does not have access to anything more then strictly necessary. I did extensive testing to ensure it works with this profile in place but I definitely didn't exhaust every possible configuration option of Hedgedoc so its possible some advanced configurations require access to a file or capability that is now being denied.

If you encounter an issue please report it [here](https://github.com/mdegat01/addon-hedgedoc/issues) and include details of your configuration and logs you saw.

## What’s changed
## 🚀 Enhancements

- Use not is empty instead of exists for UI @mdegat01 (#26)
- Deprecate `dhparamfile` option, generate it instead @mdegat01 (#27, #31 )
- Add custom apparmor profile @mdegat01 (#32, #33, #34, #36)

## 🧰 Maintenance

- Add support for beta environment @mdegat01 (#25, #28 )
- Add devcontainer config @mdegat01 (#30)

## 📚 Documentation

- Add support for beta environment @mdegat01 (#25)

## ⬆️ Dependency updates

- Bump docker/build-push-action from v2.3.0 to v2.4.0 @dependabot (#21)
- Update nodejs/npm to `14.16.1-r0` @mdegat01 (#24)
- Bump docker/setup-buildx-action from v1.1.1 to v1.1.2 @dependabot (#22)
- Bump docker/setup-qemu-action from v1.0.1 to v1.0.2 @dependabot (#23)
- Update to nodejs & npm `14.16.1-r1` @mdegat01 (#29)
- Bump actions/cache from v2.1.4 to v2.1.5 @dependabot (#35)
- Bump brpaz/hadolint-action from v1.3.1 to v1.4.0 @dependabot (#37)
- Bump addons base to `9.1.7` @mdegat01 (#38)


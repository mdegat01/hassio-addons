Primary change of this release is addition of a custom apparmor profile for increased security of the addon. These profiles carefully control what can and cannot be used to ensure the service does not have access to anything more then strictly necessary. I did extensive testing to ensure it works with this profile in place but I definitely didn't exhaust every possible configuration option of Promtail so its possible some advanced configurations require access to a file or capability that is now being denied.

If you encounter an issue please report it [here](https://github.com/mdegat01/addon-promtail/issues) and include details of your configuration and logs you saw.

## What’s changed
## 🐛 Bug fixes

- Use mapped log level variable @mdegat01 (#37)

## 🚀 Enhancements

- Support all log levels @mdegat01 (#33)
- Add custom apparmor profile @mdegat01 (#35, #36, #40, #41, #46, #54)
- Deprecate absolute path support for cafile & support blanking out @mdegat01 (#49)
- Use not is empty on configs instead of exists for UI editor @mdegat01 (#50)
- Move constants up top in scripts @mdegat01 (#53)

## 🧰 Maintenance

- Enable publishing to beta repo @mdegat01 (#42)
- Deploys to stable also go to beta @mdegat01 (#55)

## 📚 Documentation

- Update readme template for beta @mdegat01 (#43)
- Fix small typo in documentation @mdegat01 (#44)
- Remove supervisor version warning @mdegat01 (#52)

## ⬆️ Dependency updates

- Support all log levels @mdegat01 (#33)
- Bump docker/build-push-action from v2.3.0 to v2.4.0 @dependabot (#34)
- Bump docker/setup-buildx-action from v1.1.1 to v1.1.2 @dependabot (#38)
- Bump docker/setup-qemu-action from v1.0.1 to v1.0.2 @dependabot (#39)

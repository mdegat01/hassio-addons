Primary change of this release is addition of a custom apparmor profile for increased security of the addon. These profiles carefully control what can and cannot be used to ensure the service does not have access to anything more then strictly necessary. I did extensive testing to ensure it works with this profile in place but I definitely didn't exhaust every possible configuration option of Loki so its possible some advanced configurations require access to a file or capability that is now being denied.

If you encounter an issue please report it [here](https://github.com/mdegat01/addon-loki/issues) and include details of your configuration and logs you saw.

## What’s changed
## 🚀 Enhancements

- Support all log levels @mdegat01 (#33)
- Deprecate absolute path support for cafile & support blanking out @mdegat01 (#40)
- Add custom apparmor profile @mdegat01 (#38)
- Move constants up top in scripts @mdegat01 (#42, #43)

## 🧰 Maintenance

- Add support for beta environment @mdegat01 (#37, #44, #45)

## 📚 Documentation

- Add support for beta environment @mdegat01 (#37)

## ⬆️ Dependency updates

- Bump docker/build-push-action from v2.3.0 to v2.4.0 @dependabot (#34)
- Bump docker/setup-qemu-action from v1.0.1 to v1.0.2 @dependabot (#36)
- Bump docker/setup-buildx-action from v1.1.1 to v1.1.2 @dependabot (#35)
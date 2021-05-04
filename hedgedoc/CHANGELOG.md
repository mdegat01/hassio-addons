## What’s changed
## 🚨 Breaking changes

This is very small and unlikely to affect anyone but still thought I should note it. In HedgeDoc configuration under [web security aspects](https://docs.hedgedoc.org/configuration/#web-security-aspects) there are various CSP settings that can be set. In the past these were all left at their defaults and for the most part they still are with one exception: `upgradeInsecureRequests` is changed from `"auto"` to `false`. This change is done because there seems to be a bug where HedgeDoc won't start if this option becomes `true` so I am forcing it to `false`. 

Given what this option actually does (see [here](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/upgrade-insecure-requests)) and that`"auto"` actually meant `false` unless you were also using the `ssl` options it seemed really unlikely this will cause an issue for anyone. And I didn't want to hold up a release with a security fix waiting for it to be fixed. If it does somehow break you though please [report an issue](https://github.com/mdegat01/addon-hedgedoc/issues) and I'll work with you to get you updated and working again.

## 🐛 Bug fixes

- aa - no ** in peer filtering for signal directive @mdegat01 (#50)
- Don't copy OOTB views and notes from public @mdegat01 (#64)

## 🚀 Enhancements

- Improve signalling rules in apparmor @mdegat01 (#49)
- Update to HedgeDoc 1.8.0 and remove sequelizerc @mdegat01 (#59)
- Set `cspupgradeInsecureRequests` to `false` in settings @mdegat01 (#61)
- Add option to set csp directives (#62)

## 🧰 Maintenance

- Add docker to dependabot @mdegat01 (#53)
- Run CI nightly to check packages @mdegat01 (#54)

## 📚 Documentation

- Fix example config @mdegat01 (#62)

## ⬆️ Dependency updates

- Bump mariadb-client from `10.5.8-r0` to `10.5.9-r0` @mdegat01 (#52)
- Bump addons base from `9.1.7` to `9.2.0` @mdegat01 (#51)
- Bump docker/setup-buildx-action from v1.1.2 to v1.2.0 @dependabot (#56)
- Bump docker/setup-qemu-action from v1.0.2 to v1.1.0 @dependabot (#55)
- Bump docker/login-action from v1.8.0 to v1.9.0 @dependabot (#57)
- Bump docker/setup-buildx-action from v1.2.0 to v1.3.0 @dependabot (#58)
- Update to HedgeDoc 1.8.0 and remove sequelizerc @mdegat01 (#59)
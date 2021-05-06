## What’s changed
## 🚨 Breaking changes

Another small breaking change that I don't think will actually affect anyone but noting just in case. (#65)

In `1.8.1` HedgeDoc changed it so if `useSSL` is `true` then `protocolUseSSL` must also be `true`. `ssl` in the addon config is used to set `useSSL` and `access.use_ssl` is used to set `protocolUseSSL` so that means if `ssl` is `true` then `access.use_ssl` is also `true`. Documentation now notes this and if anyone happened to have a conflict between the two in their configuration then a warning is logged and `access.use_ssl` is removed from the addon configuration.

## 🚀 Enhancements

- Update to HedgeDoc to `1.8.1` @mdegat01 (#65)
- Handle ssl option conflict during setup @mdegat01 (#66)

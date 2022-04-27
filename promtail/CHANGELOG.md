## What’s changed

## 🚨 Breaking changes

- Remove deprecated option for cafile outside /ssl @mdegat01 (#197)

Would be pretty surprised if this affects anyone. The `cafile` option accepted file paths outside of `/ssl` but emitted a warning for a year or so. Now if you use this option, the file must be in `/ssl`.

## 🚀 Enhancements

- Update promtail to `2.5.0` @mdegat01 (#194)
- Allow /config access to promtail folder only @mdegat01 (#195)
- 🔒 Sign add-on with Codenotary Community Attestation Service (CAS) @mdegat01 (#196)

## ⬆️ Dependency updates

- Bump yq to `4.19.1` @mdegat01 (#186)
- Bump libsystemd-dev to `247.3-7` @mdegat01 (#191)
- Bump alpine from 3.15.0 to 3.15.4 in /promtail @dependabot (#190)
- Bump hassio-addons/debian-base to `5.3.1` @mdegat01 (#192)
- Bump yq to `4.24.5` @mdegat01 (#193)

## What’s changed

This got tagged as a major version bump to 2.0.0 because #65 is marked as a breaking change. But I realized after that it was only a breaking change for beta users, this is the first release the `last_seen` option will be available in stable. So shouldn't really be any breaking changes for anyone. Some new features though, enjoy!

## 🐛 Bug fixes

- Allow 8 fields for R900 messages @mdegat01 (#63)

## 🚀 Enhancements

- Add option for `last_seen` @mdegat01 (#54)
- 🔒 Sign add-on with Codenotary Community Attestation Service (CAS) @mdegat01 (#62)
- Add symbol length option for rtlamr @mdegat01 (#64)
- `last_seen` as sensor not attribute @mdegat01 (#65)

## 📚 Documentation

- Include my NooElec issues and dongle change in doc @mdegat01 (#67)

## ⬆️ Dependency updates

- Bump alpine from 3.15.0 to 3.15.4 in /amr2mqtt @dependabot (#59)
- Bump hassio-addons/debian-base to `5.3.1` @mdegat01 (#61)
- Bump curl to `7.80.0-r1` @mdegat01 (#66)
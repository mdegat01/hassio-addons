## What’s changed
## 🚨 Breaking changes

#17 introduces a minor breaking change. Up until now the default config had no retention period set. This causes the addon to keep indexed logs indefinitely and grow without bound. We don't want to do this so now retention period is set to 30 days by default.

This period can be configured using a new option called `days_to_keep`. It can be set as low as `2` or as high as you want. See documentation for new example and details.

The addon does not provide any easy way to retain the old behavior as we should not be growing without bound. If you truly want to retain logs indefinitely and have some other way of managing storage then you should copy the [prior default config](https://github.com/mdegat01/addon-loki/blob/5741113cb23743aa9b9f38da26f4081b8cd513d1/loki/rootfs/etc/loki/default-config.yaml) to your system and reference it using the `config_path` option.

## 🚀 Enhancements

- Add `days_to_keep` option to control retention @mdegat01 (#17)

## 📚 Documentation

- Update example @mdegat01 (#18)

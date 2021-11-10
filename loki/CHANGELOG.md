## What’s changed
⚠ ⚠ If you use the `config_path` option to provide Loki with your own custom config you will need to manually update your config to set `ingester.wal.dir` to `/data/loki/wal`. Otherwise Loki will break with a permission error on startup as Loki will try and create this directory in a place it does not have access. See [default_config.yaml#L19](https://github.com/mdegat01/addon-loki/blob/a0ab2d2acfe7d4aaddebe66894368e3fb3f4a9a1/loki/rootfs/etc/loki/default-config.yaml#L19) to see the addition to the default config you should copy to yours.

## 🐛 Bug fixes

- Fixes for #122 
  - Grant required runtime usage in AA profile @mdegat01 (#121)
  - Change ingestor's wal directory @mdegat01 (#126)

## 🧰 Maintenance

- Cache management and one-at-a-time builds in CI @mdegat01 (#120)

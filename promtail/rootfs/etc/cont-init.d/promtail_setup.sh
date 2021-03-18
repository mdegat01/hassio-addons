#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Promtail
# This file makes the config file from inputs
# ==============================================================================
config_file=/etc/promtail/config.yaml
def_scrape_configs=/etc/promtail/default-scrape-config.yaml

bashio::log.info 'Setting base config for promtail...'
cp /etc/promtail/base_config.yaml $config_file

# Set up client section
if bashio::config.exists 'client.username'; then
    bashio::log.info 'Adding basic auth to client config...'
    bashio::config.require 'client.password' "'client.username' is specified"
    echo "  basic_auth:" >> $config_file
    echo "    username: $(bashio::config 'client.username')" >> $config_file
    echo "    password: $(bashio::config 'client.password')" >> $config_file
fi

if bashio::config.exists 'client.cafile'; then
    bashio::log.info "Adding TLS to client config..."
    if ! bashio::fs.file_exists "/ssl/$(bashio::config 'client.cafile')"; then
        bashio::log.fatal
        bashio::log.fatal "The file specified for 'cafile' does not exist!"
        bashio::log.fatal "Ensure the ca file exists and is placed in the /ssl directory"
        bashio::log.fatal
        bashio::exit.nok
    fi
    echo "  tls_config:" >> $config_file
    echo "    ca_file: /ssl/$(bashio::config 'client.cafile')" >> $config_file

    if bashio::config.exists 'client.servername'; then
        echo "    server_name: $(bashio::config 'client.servername')" >> $config_file
    fi

    if bashio::config.exists 'client.certfile'; then
        bashio::log.info "Adding mTLS to client config..."
        bashio::config.require 'client.keyfile' "'client.certfile' is specified"
        if ! bashio::fs.file_exists "/ssl/$(bashio::config 'client.certfile')"; then
            bashio::log.fatal
            bashio::log.fatal "The file specified for 'certfile' does not exist!"
            bashio::log.fatal "Ensure the certificate file exists and is placed in the /ssl directory"
            bashio::log.fatal
            bashio::exit.nok
        fi
        if ! bashio::fs.file_exists "/ssl/$(bashio::config 'client.keyfile')"; then
            bashio::log.fatal
            bashio::log.fatal "The file specified for 'keyfile' does not exist!"
            bashio::log.fatal "Ensure the key file exists and is placed in the /ssl directory"
            bashio::log.fatal
            bashio::exit.nok
        fi
        echo "    cert_file: /ssl/$(bashio::config 'client.certfile')" >> $config_file
        echo "    key_file: /ssl/$(bashio::config 'client.keyfile')" >> $config_file
    fi
fi

# Add in scrape configs
echo >> $config_file
echo "scrape_configs:" >> $config_file
if bashio::config.true 'skip_default_scrape_config'; then
    bashio::log.info 'Skipping default journald scrape config...'
    bashio::config.require 'additional_scrape_configs' "'skip_default_scrape_config' is true"
fi

if bashio::config.exists 'additional_scrape_configs'; then
    bashio::log.info "Adding custom scrape configs..."
    if ! bashio::fs.file_exists "$(bashio::config 'additional_scrape_configs')"; then
        bashio::log.fatal
        bashio::log.fatal "The file specified for 'additional_scrape_configs' does not exist!"
        bashio::log.fatal "Ensure the file exists at the path specified"
        bashio::log.fatal
        bashio::exit.nok
    fi

    add_scrape_configs="$(bashio::config 'additional_scrape_configs')"
    if bashio::config.true 'skip_default_scrape_config'; then
        yq -NP e '[] + .' $add_scrape_configs >> $config_file
    else
        yq -NP eval-all 'select(fi == 0) * select(fi == 1)' $def_scrape_configs $add_scrape_configs >> $config_file
    fi
else
    cat $def_scrape_configs >> $config_file
fi

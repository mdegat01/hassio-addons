#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Loki
# This file configures nginx
# ==============================================================================
declare certfile
declare keyfile

bashio::config.require.ssl

if bashio::config.true 'ssl'; then
    certfile=$(bashio::config 'certfile')
    keyfile=$(bashio::config 'keyfile')

    if bashio::config.exists 'cafile'; then
        cafile=$(bashio::config 'cafile')
	
	mv /etc/nginx/servers/direct-mtls.disabled /etc/nginx/servers/direct.conf
	sed -i "s#%%cafile%%#${cafile}#g" /etc/nginx/servers/direct.conf
    else
        mv /etc/nginx/servers/direct-ssl.disabled /etc/nginx/servers/direct.conf
    fi
	    
    sed -i "s#%%certfile%%#${certfile}#g" /etc/nginx/servers/direct.conf
    sed -i "s#%%keyfile%%#${keyfile}#g" /etc/nginx/servers/direct.conf
else
    mv /etc/nginx/servers/direct.disabled /etc/nginx/servers/direct.conf
fi


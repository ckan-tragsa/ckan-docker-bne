#!/bin/bash

# ckanext-scheming/ckanext-schemingdcat: Update settings defined in the envvars (https://github.com/ckan/ckanext-pages#configuration)
echo "[docker-entrypoint.01_setup_ckanext_config] Clear index"
ckan -c $CKAN_INI search-index clear

# Add SMTP settings if CKAN__SMTP_ENABLED is True
if [ "$CKAN__SMTP_ENABLED" = "True" ]; then
    echo "[docker-entrypoint.01_setup_ckanext_config] Adding SMTP settings to the CKAN config file"
    ckan config-tool $CKAN_INI \
        "smtp.server=$CKAN_SMTP_SERVER" \
        "smtp.starttls=$CKAN_SMTP_STARTTLS" \
        "smtp.user=$CKAN_SMTP_USER" \
        "smtp.password=$CKAN_SMTP_PASSWORD" \
        "smtp.mail_from=$CKAN_SMTP_MAIL_FROM" \
        "smtp.reply_to=" \
        "email_to=" \
        "error_email_from="
fi

# Rebuild index
echo "[docker-entrypoint.01_setup_ckanext_config] Rebuild index"
ckan -c $CKAN_INI search-index rebuild
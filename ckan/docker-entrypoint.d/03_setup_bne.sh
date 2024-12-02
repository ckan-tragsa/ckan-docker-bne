#!/bin/bash

# Add pages CKAN config file (https://github.com/ckan/ckanext-bne)
echo "[docker-entrypoint.03_setup_bne] Loading BNE config in the CKAN config file"
ckan config-tool $CKAN_INI \
     "googleanalytics.id = $CKANEXT__GOOGLEANALYTICS__ID" \
     "ckanext.contact.mail_to = $CKANEXT__CONTACT__EMAIL_TO"
#!/bin/bash

# Add pages CKAN config file (https://github.com/ckan/ckanext-bne)
echo "[docker-entrypoint.06_setup_bne] Loading bne config in the CKAN config file"
ckan config-tool $CKAN_INI \
     "googleanalytics.id = $CKANEXT__GOOGLEANALYTICS__ID" \
     "ckanext.contact.mail_to = $CKANEXT__CONTACT__EMAIL_TO" \
     "smtp.server = $CKAN_SMTP_SERVER" \
     "smtp.starttls = $CKAN_SMTP_STARTTLS" \
     "smtp.user = $CKAN_SMTP_USER" \
     "smtp.password = $CKAN_SMTP_PASSWORD" \
     "smtp.mail_from = $CKAN_SMTP_MAIL_FROM"
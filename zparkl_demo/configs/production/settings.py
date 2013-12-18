from zparkl_demo.configs.common.settings import *

DEBUG = False
TEMPLATE_DEBUG = DEBUG
PROJECT_DOMAIN = "http://zparkl_demo.com"

# Database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'zparkl_demo',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
    }
}

# Caching
CACHE_BACKEND = 'johnny.backends.memcached://127.0.0.1:11211'
GOOGLE_MAPS_API_KEY = "AIzaSyBg7rZjToQyi9izk13QfLegTueVEuWxfa0"

ADMINS = (('ARTMINSTER Dev', 'dev@artminster.com')),
MANAGERS = ('ARTMINSTER Dev', 'dev@artminster.com'),

PAYPAL_RECEIVER_EMAIL = "ben@artminster.com"
PAYPAL_SANDBOX_MODE = False

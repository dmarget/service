<?php

define( 'DB_NAME', 'wpDB' );

define( 'DB_USER', 'root' );

define( 'DB_PASSWORD', 'root' );

define( 'DB_HOST', 'mysql' );

define( 'DB_CHARSET', 'utf8' );


define( 'DB_COLLATE', '' );
define( 'AUTH_KEY',         'unique phrase' );
define( 'SECURE_AUTH_KEY',  'unique phrase' );
define( 'LOGGED_IN_KEY',    'unique phrase' );
define( 'NONCE_KEY',        'unique phrase' );
define( 'AUTH_SALT',        'unique phrase' );
define( 'SECURE_AUTH_SALT', 'unique phrase' );
define( 'LOGGED_IN_SALT',   'unique phrase' );
define( 'NONCE_SALT',       'unique phrase' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';

<?php
// Set “HTTPOnly” attribute for session cookies
ini_set('session.cookie_httponly', 1);

// Define path to application directory
defined('APPLICATION_PATH') || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

// Define Name to application 
defined('APPLICATION_NAME') || define('APPLICATION_NAME', 'Finny Oracle');

// Define application environment
defined('APPLICATION_ENV') || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Define public path
defined('PUBLIC_PATH') || define('PUBLIC_PATH', realpath(dirname(__FILE__)));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    get_include_path(),
)));

/** Zend_Application */
require_once 'Zend/Application.php';
/** common zend functions  */
require_once APPLICATION_PATH . '/../public/global/functions.php';

// Create application, bootstrap, and run
$application = new Zend_Application(
        APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini'
);

$application->bootstrap()->run();

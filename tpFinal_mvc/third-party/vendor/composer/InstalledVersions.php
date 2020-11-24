<?php

namespace Composer;

use Composer\Semver\VersionParser;






class InstalledVersions
{
private static $installed = array (
  'root' => 
  array (
    'pretty_version' => '1.0.0+no-version-set',
    'version' => '1.0.0.0',
    'aliases' => 
    array (
    ),
    'reference' => NULL,
    'name' => '__root__',
  ),
  'versions' => 
  array (
    '__root__' => 
    array (
      'pretty_version' => '1.0.0+no-version-set',
      'version' => '1.0.0.0',
      'aliases' => 
      array (
      ),
      'reference' => NULL,
    ),
    'js-phpize/js-phpize' => 
    array (
      'pretty_version' => '2.8.4',
      'version' => '2.8.4.0',
      'aliases' => 
      array (
      ),
      'reference' => '9600d41d454b562646c6aab9aef7318cdc1848a8',
    ),
    'js-phpize/js-phpize-phug' => 
    array (
      'pretty_version' => '2.2.1',
      'version' => '2.2.1.0',
      'aliases' => 
      array (
      ),
      'reference' => 'fcc59b3511d61a403d905624bb959dc1773138b9',
    ),
    'js-transformer/js-transformer' => 
    array (
      'pretty_version' => '1.0.0',
      'version' => '1.0.0.0',
      'aliases' => 
      array (
      ),
      'reference' => '81730d3ae67824d664615ebb7f721cfa7d77179f',
    ),
    'kylekatarnls/jade-php' => 
    array (
      'replaced' => 
      array (
        0 => '3.4.1',
      ),
    ),
    'nodejs-php-fallback/nodejs-php-fallback' => 
    array (
      'pretty_version' => '1.6.0',
      'version' => '1.6.0.0',
      'aliases' => 
      array (
      ),
      'reference' => '0dbdbc0cccf3c6c4a86189b21ce898252e287072',
    ),
    'phug/ast' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/compiler' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/dependency-injection' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/event' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/facade' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/formatter' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/invoker' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/js-transformer-filter' => 
    array (
      'pretty_version' => '1.2.0',
      'version' => '1.2.0.0',
      'aliases' => 
      array (
      ),
      'reference' => 'dbadf07950ee552471905001266cdae7793868a8',
    ),
    'phug/lexer' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/parser' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/phug' => 
    array (
      'pretty_version' => '1.8.1',
      'version' => '1.8.1.0',
      'aliases' => 
      array (
      ),
      'reference' => 'ee81108f9d7be420b8c57571679168ebd64f1762',
    ),
    'phug/reader' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/renderer' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'phug/util' => 
    array (
      'replaced' => 
      array (
        0 => '1.8.1',
      ),
    ),
    'pug-php/pug' => 
    array (
      'pretty_version' => '3.4.1',
      'version' => '3.4.1.0',
      'aliases' => 
      array (
      ),
      'reference' => '4f5bb7406dddc482966c607fca00e287347abec8',
    ),
    'spipu/html2pdf' => 
    array (
      'pretty_version' => 'v5.2.2',
      'version' => '5.2.2.0',
      'aliases' => 
      array (
      ),
      'reference' => 'e6d8ca22347b6691bb8c2652212b1be2c89b3eff',
    ),
    'symfony/polyfill-mbstring' => 
    array (
      'pretty_version' => 'v1.20.0',
      'version' => '1.20.0.0',
      'aliases' => 
      array (
      ),
      'reference' => '39d483bdf39be819deabf04ec872eb0b2410b531',
    ),
    'symfony/polyfill-php80' => 
    array (
      'pretty_version' => 'v1.20.0',
      'version' => '1.20.0.0',
      'aliases' => 
      array (
      ),
      'reference' => 'e70aa8b064c5b72d3df2abd5ab1e90464ad009de',
    ),
    'symfony/var-dumper' => 
    array (
      'pretty_version' => 'v5.1.8',
      'version' => '5.1.8.0',
      'aliases' => 
      array (
      ),
      'reference' => '4e13f3fcefb1fcaaa5efb5403581406f4e840b9a',
    ),
    'tecnickcom/tcpdf' => 
    array (
      'pretty_version' => '6.3.5',
      'version' => '6.3.5.0',
      'aliases' => 
      array (
      ),
      'reference' => '19a535eaa7fb1c1cac499109deeb1a7a201b4549',
    ),
  ),
);







public static function getInstalledPackages()
{
return array_keys(self::$installed['versions']);
}









public static function isInstalled($packageName)
{
return isset(self::$installed['versions'][$packageName]);
}














public static function satisfies(VersionParser $parser, $packageName, $constraint)
{
$constraint = $parser->parseConstraints($constraint);
$provided = $parser->parseConstraints(self::getVersionRanges($packageName));

return $provided->matches($constraint);
}










public static function getVersionRanges($packageName)
{
if (!isset(self::$installed['versions'][$packageName])) {
throw new \OutOfBoundsException('Package "' . $packageName . '" is not installed');
}

$ranges = array();
if (isset(self::$installed['versions'][$packageName]['pretty_version'])) {
$ranges[] = self::$installed['versions'][$packageName]['pretty_version'];
}
if (array_key_exists('aliases', self::$installed['versions'][$packageName])) {
$ranges = array_merge($ranges, self::$installed['versions'][$packageName]['aliases']);
}
if (array_key_exists('replaced', self::$installed['versions'][$packageName])) {
$ranges = array_merge($ranges, self::$installed['versions'][$packageName]['replaced']);
}
if (array_key_exists('provided', self::$installed['versions'][$packageName])) {
$ranges = array_merge($ranges, self::$installed['versions'][$packageName]['provided']);
}

return implode(' || ', $ranges);
}





public static function getVersion($packageName)
{
if (!isset(self::$installed['versions'][$packageName])) {
throw new \OutOfBoundsException('Package "' . $packageName . '" is not installed');
}

if (!isset(self::$installed['versions'][$packageName]['version'])) {
return null;
}

return self::$installed['versions'][$packageName]['version'];
}





public static function getPrettyVersion($packageName)
{
if (!isset(self::$installed['versions'][$packageName])) {
throw new \OutOfBoundsException('Package "' . $packageName . '" is not installed');
}

if (!isset(self::$installed['versions'][$packageName]['pretty_version'])) {
return null;
}

return self::$installed['versions'][$packageName]['pretty_version'];
}





public static function getReference($packageName)
{
if (!isset(self::$installed['versions'][$packageName])) {
throw new \OutOfBoundsException('Package "' . $packageName . '" is not installed');
}

if (!isset(self::$installed['versions'][$packageName]['reference'])) {
return null;
}

return self::$installed['versions'][$packageName]['reference'];
}





public static function getRootPackage()
{
return self::$installed['root'];
}







public static function getRawData()
{
return self::$installed;
}



















public static function reload($data)
{
self::$installed = $data;
}
}

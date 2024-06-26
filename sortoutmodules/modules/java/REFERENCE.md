# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

#### Public Classes

* [`java`](#java): This module manages the Java runtime package

#### Private Classes

* `java::config`
* `java::params`: This class builds a hash of JDK/JRE packages and (for Debian)
alternatives.  For wheezy/precise, we provide Oracle JDK/JRE
options, even though those are not in the package repositories.

### Defined types

* [`java::adopt`](#java--adopt): Install one or more versions of AdoptOpenJDK Java.
* [`java::adoptium`](#java--adoptium): Install one or more versions of Adoptium Temurin OpenJDK (former AdoptOpenJDK).
* [`java::download`](#java--download): Installs Java from a url location.
* [`java::sap`](#java--sap): Install one or more versions of SAPJVM or Sapmachine

## Classes

### <a name="java"></a>`java`

This module manages the Java runtime package

#### Parameters

The following parameters are available in the `java` class:

* [`distribution`](#-java--distribution)
* [`version`](#-java--version)
* [`package`](#-java--package)
* [`package_options`](#-java--package_options)
* [`java_alternative`](#-java--java_alternative)
* [`java_alternative_path`](#-java--java_alternative_path)
* [`java_home`](#-java--java_home)

##### <a name="-java--distribution"></a>`distribution`

Data type: `String`

The java distribution to install. Can be one of "jdk" or "jre",
or other platform-specific options where there are multiple
implementations available (eg: OpenJDK vs Oracle JDK).

Default value: `'jdk'`

##### <a name="-java--version"></a>`version`

Data type: `Pattern[/present|installed|latest|^[.+_0-9a-zA-Z:~-]+$/]`

The version of java to install. By default, this module simply ensures
that java is present, and does not require a specific version.

Default value: `'present'`

##### <a name="-java--package"></a>`package`

Data type: `Optional[String]`

The name of the java package. This is configurable in case a non-standard
java package is desired.

Default value: `undef`

##### <a name="-java--package_options"></a>`package_options`

Data type: `Optional[Array]`

Array of strings to pass installation options to the 'package' Puppet resource.
Options available depend on the 'package' provider for the target OS.

Default value: `undef`

##### <a name="-java--java_alternative"></a>`java_alternative`

Data type: `Optional[String]`

The name of the java alternative to use on Debian systems.
"update-java-alternatives -l" will show which choices are available.
If you specify a particular package, you will almost always also
want to specify which java_alternative to choose. If you set
this, you also need to set the path below.

Default value: `undef`

##### <a name="-java--java_alternative_path"></a>`java_alternative_path`

Data type: `Optional[String]`

The path to the "java" command on Debian systems. Since the
alternatives system makes it difficult to verify which
alternative is actually enabled, this is required to ensure the
correct JVM is enabled.

Default value: `undef`

##### <a name="-java--java_home"></a>`java_home`

Data type: `Optional[String]`

The path to where the JRE is installed. This will be set as an
environment variable.

Default value: `undef`

## Defined types

### <a name="java--adopt"></a>`java::adopt`

Defined Type java::adopt

#### Parameters

The following parameters are available in the `java::adopt` defined type:

* [`ensure`](#-java--adopt--ensure)
* [`version`](#-java--adopt--version)
* [`version_major`](#-java--adopt--version_major)
* [`version_minor`](#-java--adopt--version_minor)
* [`java`](#-java--adopt--java)
* [`proxy_server`](#-java--adopt--proxy_server)
* [`proxy_type`](#-java--adopt--proxy_type)
* [`url`](#-java--adopt--url)
* [`basedir`](#-java--adopt--basedir)
* [`manage_basedir`](#-java--adopt--manage_basedir)
* [`package_type`](#-java--adopt--package_type)
* [`manage_symlink`](#-java--adopt--manage_symlink)
* [`symlink_name`](#-java--adopt--symlink_name)

##### <a name="-java--adopt--ensure"></a>`ensure`

Data type: `Enum['present']`

Install or remove the package.

Default value: `'present'`

##### <a name="-java--adopt--version"></a>`version`

Data type: `String[1]`

Version of Java to install, e.g. '8' or '9'. Default values for major and minor versions will be used.

Default value: `'8'`

##### <a name="-java--adopt--version_major"></a>`version_major`

Data type: `Optional[String]`

Major version which should be installed, e.g. '8u101' or '9.0.4'. Must be used together with version_minor.

Default value: `undef`

##### <a name="-java--adopt--version_minor"></a>`version_minor`

Data type: `Optional[String]`

Minor version which should be installed, e.g. 'b12' (for version = '8') or '11' (for version != '8').
Must be used together with version_major.

Default value: `undef`

##### <a name="-java--adopt--java"></a>`java`

Data type: `String[1]`

Type of Java Standard Edition to install, jdk or jre.

Default value: `'jdk'`

##### <a name="-java--adopt--proxy_server"></a>`proxy_server`

Data type: `Optional[String]`

Specify a proxy server, with port number if needed. ie: https://example.com:8080. (passed to archive)

Default value: `undef`

##### <a name="-java--adopt--proxy_type"></a>`proxy_type`

Data type: `Optional[String]`

Proxy server type (none|http|https|ftp). (passed to archive)

Default value: `undef`

##### <a name="-java--adopt--url"></a>`url`

Data type: `Optional[String]`

Full URL

Default value: `undef`

##### <a name="-java--adopt--basedir"></a>`basedir`

Data type: `Optional[String]`

Directory under which the installation will occur. If not set, defaults to
/usr/lib/jvm for Debian and /usr/java for RedHat.

Default value: `undef`

##### <a name="-java--adopt--manage_basedir"></a>`manage_basedir`

Data type: `Boolean`

Whether to manage the basedir directory.
Note: /usr/lib/jvm is managed for Debian by default, separate from this parameter.

Default value: `true`

##### <a name="-java--adopt--package_type"></a>`package_type`

Data type: `Optional[String]`

Type of installation package for specified version of java_se. java_se 6 comes
in a few installation package flavors and we need to account for them.
Optional forced package types: rpm, rpmbin, tar.gz

Default value: `undef`

##### <a name="-java--adopt--manage_symlink"></a>`manage_symlink`

Data type: `Boolean`

Whether to manage a symlink that points to the installation directory.  Defaults to false.

Default value: `false`

##### <a name="-java--adopt--symlink_name"></a>`symlink_name`

Data type: `Optional[String]`

The name for the optional symlink in the installation directory.

Default value: `undef`

### <a name="java--adoptium"></a>`java::adoptium`

Defined Type java::adoptium

#### Parameters

The following parameters are available in the `java::adoptium` defined type:

* [`ensure`](#-java--adoptium--ensure)
* [`version_major`](#-java--adoptium--version_major)
* [`version_minor`](#-java--adoptium--version_minor)
* [`version_patch`](#-java--adoptium--version_patch)
* [`version_build`](#-java--adoptium--version_build)
* [`proxy_server`](#-java--adoptium--proxy_server)
* [`proxy_type`](#-java--adoptium--proxy_type)
* [`url`](#-java--adoptium--url)
* [`basedir`](#-java--adoptium--basedir)
* [`manage_basedir`](#-java--adoptium--manage_basedir)
* [`manage_symlink`](#-java--adoptium--manage_symlink)
* [`symlink_name`](#-java--adoptium--symlink_name)

##### <a name="-java--adoptium--ensure"></a>`ensure`

Data type: `Enum['present']`

Install or remove the package.

Default value: `'present'`

##### <a name="-java--adoptium--version_major"></a>`version_major`

Data type: `Optional[String]`

Major version which should be installed, e.g. '16' or '17'

Default value: `undef`

##### <a name="-java--adoptium--version_minor"></a>`version_minor`

Data type: `Optional[String]`

Minor version which should be installed, e.g. '0'

Default value: `undef`

##### <a name="-java--adoptium--version_patch"></a>`version_patch`

Data type: `Optional[String]`

Minor version which should be installed, e.g. '2'

Default value: `undef`

##### <a name="-java--adoptium--version_build"></a>`version_build`

Data type: `Optional[String]`

Build version which should be installed, e.g. '07'

Default value: `undef`

##### <a name="-java--adoptium--proxy_server"></a>`proxy_server`

Data type: `Optional[String]`

Specify a proxy server, with port number if needed. ie: https://example.com:8080. (passed to archive)

Default value: `undef`

##### <a name="-java--adoptium--proxy_type"></a>`proxy_type`

Data type: `Optional[Enum['none', 'http', 'https', 'ftp']]`

Proxy server type (none|http|https|ftp). (passed to archive)

Default value: `undef`

##### <a name="-java--adoptium--url"></a>`url`

Data type: `Optional[String]`

Full URL

Default value: `undef`

##### <a name="-java--adoptium--basedir"></a>`basedir`

Data type: `Optional[String]`

Directory under which the installation will occur. If not set, defaults to
/usr/lib/jvm for Debian and /usr/java for RedHat.

Default value: `undef`

##### <a name="-java--adoptium--manage_basedir"></a>`manage_basedir`

Data type: `Boolean`

Whether to manage the basedir directory.  Defaults to false.
Note: /usr/lib/jvm is managed for Debian by default, separate from this parameter.

Default value: `true`

##### <a name="-java--adoptium--manage_symlink"></a>`manage_symlink`

Data type: `Boolean`

Whether to manage a symlink that points to the installation directory.  Defaults to false.

Default value: `false`

##### <a name="-java--adoptium--symlink_name"></a>`symlink_name`

Data type: `Optional[String]`

The name for the optional symlink in the installation directory.

Default value: `undef`

### <a name="java--download"></a>`java::download`

Defined Type java::download

#### Parameters

The following parameters are available in the `java::download` defined type:

* [`ensure`](#-java--download--ensure)
* [`version`](#-java--download--version)
* [`version_major`](#-java--download--version_major)
* [`version_minor`](#-java--download--version_minor)
* [`java_se`](#-java--download--java_se)
* [`proxy_server`](#-java--download--proxy_server)
* [`proxy_type`](#-java--download--proxy_type)
* [`url`](#-java--download--url)
* [`jce`](#-java--download--jce)
* [`jce_url`](#-java--download--jce_url)
* [`basedir`](#-java--download--basedir)
* [`manage_basedir`](#-java--download--manage_basedir)
* [`package_type`](#-java--download--package_type)
* [`manage_symlink`](#-java--download--manage_symlink)
* [`symlink_name`](#-java--download--symlink_name)

##### <a name="-java--download--ensure"></a>`ensure`

Data type: `Enum['present']`

Install or remove the package.

Default value: `'present'`

##### <a name="-java--download--version"></a>`version`

Data type: `String[1]`

Version of Java to install, e.g. '7' or '8'. Default values for major and minor versions will be used.

Default value: `'8'`

##### <a name="-java--download--version_major"></a>`version_major`

Data type: `Optional[String]`

Major version which should be installed, e.g. '8u101'. Must be used together with version_minor.

Default value: `undef`

##### <a name="-java--download--version_minor"></a>`version_minor`

Data type: `Optional[String]`

Minor version which should be installed, e.g. 'b12'. Must be used together with version_major.

Default value: `undef`

##### <a name="-java--download--java_se"></a>`java_se`

Data type: `String[1]`

Type of Java Standard Edition to install, jdk or jre.

Default value: `'jdk'`

##### <a name="-java--download--proxy_server"></a>`proxy_server`

Data type: `Optional[String]`

Specify a proxy server, with port number if needed. ie: https://example.com:8080. (passed to archive)

Default value: `undef`

##### <a name="-java--download--proxy_type"></a>`proxy_type`

Data type: `Optional[Enum['none', 'http', 'https', 'ftp']]`

Proxy server type (none|http|https|ftp). (passed to archive)

Default value: `undef`

##### <a name="-java--download--url"></a>`url`

Data type: `Optional[String]`

Full URL

Default value: `undef`

##### <a name="-java--download--jce"></a>`jce`

Data type: `Boolean`

Install Oracles Java Cryptographic Extensions into the JRE or JDK

Default value: `false`

##### <a name="-java--download--jce_url"></a>`jce_url`

Data type: `Optional[String]`

Full URL to the jce zip file

Default value: `undef`

##### <a name="-java--download--basedir"></a>`basedir`

Data type: `Optional[String]`

Directory under which the installation will occur. If not set, defaults to
/usr/lib/jvm for Debian and /usr/java for RedHat.

Default value: `undef`

##### <a name="-java--download--manage_basedir"></a>`manage_basedir`

Data type: `Boolean`

Whether to manage the basedir directory.  Defaults to false.
Note: /usr/lib/jvm is managed for Debian by default, separate from this parameter.

Default value: `false`

##### <a name="-java--download--package_type"></a>`package_type`

Data type: `Optional[String]`

Type of installation package for specified version of java_se. java_se 6 comes
in a few installation package flavors and we need to account for them.
Optional forced package types: rpm, rpmbin, tar.gz

Default value: `undef`

##### <a name="-java--download--manage_symlink"></a>`manage_symlink`

Data type: `Boolean`

Whether to manage a symlink that points to the installation directory.  Defaults to false.

Default value: `false`

##### <a name="-java--download--symlink_name"></a>`symlink_name`

Data type: `Optional[String]`

The name for the optional symlink in the installation directory.

Default value: `undef`

### <a name="java--sap"></a>`java::sap`

Defined Type java::sap

#### Parameters

The following parameters are available in the `java::sap` defined type:

* [`ensure`](#-java--sap--ensure)
* [`version`](#-java--sap--version)
* [`version_full`](#-java--sap--version_full)
* [`java`](#-java--sap--java)
* [`proxy_server`](#-java--sap--proxy_server)
* [`proxy_type`](#-java--sap--proxy_type)
* [`basedir`](#-java--sap--basedir)
* [`manage_basedir`](#-java--sap--manage_basedir)
* [`manage_symlink`](#-java--sap--manage_symlink)
* [`symlink_name`](#-java--sap--symlink_name)

##### <a name="-java--sap--ensure"></a>`ensure`

Data type: `Enum['present']`

Install or remove the package.

Default value: `'present'`

##### <a name="-java--sap--version"></a>`version`

Data type: `String[1]`

Version of Java to install, e.g. '8' or '9'. Default values for full versions will be used.

Default value: `'8'`

##### <a name="-java--sap--version_full"></a>`version_full`

Data type: `Optional[String]`

Major version which should be installed, e.g. '8.1.063' or '11.0.7'. If used, "version" parameter is ignored.

Default value: `undef`

##### <a name="-java--sap--java"></a>`java`

Data type: `String[1]`

Type of Java Edition to install, jdk or jre.

Default value: `'jdk'`

##### <a name="-java--sap--proxy_server"></a>`proxy_server`

Data type: `Optional[String]`

Specify a proxy server, with port number if needed. ie: https://example.com:8080. (passed to archive)

Default value: `undef`

##### <a name="-java--sap--proxy_type"></a>`proxy_type`

Data type: `Optional[Enum['none', 'http', 'https', 'ftp']]`

Proxy server type (none|http|https|ftp). (passed to archive)

Default value: `undef`

##### <a name="-java--sap--basedir"></a>`basedir`

Data type: `Optional[String]`

Directory under which the installation will occur. If not set, defaults to
/usr/lib/jvm for Debian and /usr/java for RedHat.

Default value: `undef`

##### <a name="-java--sap--manage_basedir"></a>`manage_basedir`

Data type: `Boolean`

Whether to manage the basedir directory.
Note: /usr/lib/jvm is managed for Debian by default, separate from this parameter.

Default value: `true`

##### <a name="-java--sap--manage_symlink"></a>`manage_symlink`

Data type: `Boolean`

Whether to manage a symlink that points to the installation directory.  Defaults to false.

Default value: `false`

##### <a name="-java--sap--symlink_name"></a>`symlink_name`

Data type: `Optional[String]`

The name for the optional symlink in the installation directory.

Default value: `undef`


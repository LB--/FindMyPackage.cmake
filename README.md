FindMyPackage.cmake
===================

This is my personal CMake FindPackage script template - it handles having multiple versions installed and it doesn't require any modification for my purposes other than changing the filename.
You can use it for your purposes too!
Simply change the filename to `Find<name of your package>.cmake` and make sure your install script puts things in the right places.
You need to use a versioned directory structure for your installation, with a package config file stored at a location like `MyPackage/3.14.159/cmake/MyPackage.cmake`.
Components are also supported, just put their package config files at a location like `MyPackage/3.14.159/cmake/MyPackage/Component.cmake`.

`MyPackage_ROOT` can be set before calling `find_package` to help with finding the desired location, otherwise it will be found automatically if it is in a standard location.
Within the `MyPackage_ROOT` directory, there should be a directory named `MyPackage`, and within that directory should be directories names after the versions they contain (e.g. 3.14.159).
Within each version directory is a typical installation tree with directories such as `cmake`, `include`, `lib`, `bin`, etc.

There is support for rich version matching - for example, `find(MyPackage 2 EXACT)` will find the highest version with a major version of 2, whereas `find(MyPackage 3.14)` will find the highest available version where the major version number is _at least_ 3 and the minor version number is _at least_ 14.
All CMake-style versions are supported - that is, versions in the format `major[.minor[.patch[.tweak]]]`.
Although you can have different depths for each version, I recommend that you use the same depth for all versions to avoid confusion.
When requesting optional components, only the version(s) with the most requested optional components are considered (so a lower version may be selected if it has more of the desired optional components).
Obviously, versions that are missing requsted required components are not considered at all.

## What if my package has `::` in it?
That's great! You can have a slash in your package name and the 'friendly name' will replace the slashes with double colons.
For example, for my library `LB::events`, I create a directory named `FindLB` and within it place this file named as `events.cmake`.
Then users can use `find_package(LB/events)` and it will work, whilst the package name displayed in the output is `LB::events`.
And yes, CMake variable names can contain slashes - `${LB/events_FOUND}` will indicate whether my package is found.
The script will find and include my package config file at a path like `LB/events/3.14.159/cmake/LB/events.cmake` and it is expected that this will introduce an imported target named `LB::events`.

## Case Sensitivity
Rmemeber: CMake variable names are case sensitive.
If your package is named `CamelCasePackage`, then you will need to listen for `${CamelCasePackage_FOUND}` with the same case.

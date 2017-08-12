# All variables and this file are optional, if they are not present the PG and the
# makefiles will try to parse the correct values from the file system.
#
# Variables that specify exclusions can use % as a wildcard to specify that anything in
# that position will match. A partial path can also be specified to, for example, exclude
# a whole folder from the parsed paths from the file system
#
# Variables can be specified using = or +=
# = will clear the contents of that variable both specified from the file or the ones parsed
# from the file system
# += will add the values to the previous ones in the file or the ones parsed from the file
# system
#
# The PG can be used to detect errors in this file, just create a new project with this addon
# and the PG will write to the console the kind of error and in which line it is

meta:
	ADDON_NAME = ofxPybind11
	ADDON_DESCRIPTION = Wrapper for Pybind11
	ADDON_AUTHOR = Katsuyoshi Hotta
	ADDON_TAGS = "python"
	ADDON_URL = https://github.com/SavantCat/ofxPybind11

common:
	# dependencies with other addons, a list of them separated by spaces
	# or use += in several lines
	# ADDON_DEPENDENCIES =

	# include search paths, this will be usually parsed from the file system
	# but if the addon or addon libraries need special search paths they can be
	# specified here separated by spaces or one per line using +=
	msys2:
		ADDON_PKG_CONFIG_LIBRARIES = pybind11
		ADDON_LIBS_EXCLUDE = libs/python/%
	  ADDON_INCLUDES_EXCLUDE = libs/pybind11
	  ADDON_INCLUDES_EXCLUDE += libs/pybind11/%
		ADDON_INCLUDES_EXCLUDE += libs/python
		ADDON_INCLUDES_EXCLUDE += libs/python/%

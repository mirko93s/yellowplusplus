IF !DEF(__RGBDS_MAJOR__)
	fail "yellowplusplus requires rgbds v1.0.0 or newer."
ENDC
IF __RGBDS_MAJOR__ < 1
	fail "yellowplusplus requires rgbds v1.0.0 or newer."
ENDC
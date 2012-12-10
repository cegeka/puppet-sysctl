define sysctl::conf($key=$name, $value=undef, $ensure='present') {

  if $ensure in [ present, absent ] {
    $ensure_real = $ensure
  } else {
    fail("Sysctl::Conf[${title}]: parameter ensure must be present or absent")
  }

  case $ensure_real {
    'absent':
      {
      }
    'present':
      {
        if ($value == undef) {
          fail("Sysctl::Conf[${title}]: parameter value must be defined")
        }
      }
    default: { notice('The given ensure parameter is not supported') }
  }

}

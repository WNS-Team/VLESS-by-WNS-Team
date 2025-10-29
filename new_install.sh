#new_install.sh

check_if_running_as_root() {
  if [[ "$(id -u)" -eq 0 ]]; then
    return 0
  else
    echo "error: You must run this script as root!"
    return 1
  fi
}

if [[ -f '/etc/systemd/system/xray.service' ]] && [[ -f '/usr/local/bin/xray' ]]; then
  echo XRAY_IS_INSTALLED_BEFORE_RUNNING_SCRIPT=1
else
  echo XRAY_IS_INSTALLED_BEFORE_RUNNING_SCRIPT=0
fi
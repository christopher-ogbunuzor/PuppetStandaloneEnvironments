# message of the day params profile
class profile::motd::params (
  String $motd_main   = '/etc/motd',
  String $motd_local  = '/etc/motd_local',
  String $motd_behav  = 'deploy',
) {
}

# definition of test1 role
class role::test1 {

  include profile::puppet::clientscope
  include profile::motd::init

}

class UserSession < Authlogic::Session::Base
# configuration here, see documentation for sub-modules
# of Authlogic::Session
  logout_on_timeout true
  consecutive_failed_logins_limit 10
end
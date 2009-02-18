print "Using native SQLServer via ODBC\n"
require_dependency 'models/course'
require 'logger'

ActiveRecord::Base.logger = Logger.new("debug.log")

ActiveRecord::Base.configurations = {
  'arunit' => {
    :adapter  => 'sqlserver',
    :mode     => 'ODBC',
    :dsn      => 'DRIVER=/opt/local/lib/libtdsodbc.so;TDS_Version=8.0;SERVER=172.16.132.128;DATABASE=activerecord_unittest;Port=1433;uid=rails;pwd=;'
  },
  'arunit2' => {
    :adapter  => 'sqlserver',
    :mode     => 'ODBC',
    :dsn      => 'DRIVER=/opt/local/lib/libtdsodbc.so;TDS_Version=8.0;SERVER=172.16.132.128;DATABASE=activerecord_unittest2;Port=1433;uid=rails;pwd=;'  
  }
}

ActiveRecord::Base.establish_connection 'arunit'
Course.establish_connection 'arunit2'

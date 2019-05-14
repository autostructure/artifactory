# Manages mysql server if automated

  class { '::mysql::server':
    package_name            => 'mariadb-server',
    package_ensure          => '5.5.60-1.el7_5',
    root_password           => 'password',
    remove_default_accounts => true,
  }


# create_resources(mysql::db, hiera(mysql::server::db, {}))
  mysql::db { 'artdb':
    user     => $db_username,
    password => $db_password,
    dbname   => 'artdb',
    host     => 'localhost',
    grant    => 'ALL',
  }

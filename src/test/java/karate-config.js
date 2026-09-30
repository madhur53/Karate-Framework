function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'staging';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
	username: 'admin1',
	password: 'welcome',
	_url: 'http://localhost:9897'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
		config.username = 'author';
		config.password = 'authorpassword';
  } else if (env == 'e2e') {
    // customize
		config.username = 'user';
		config.password = 'userpassword';
  }	else if(env == 'staging'){
		//Initialize the config for staging
		config.username = 'stagingadmin1';
		config.password = 'stagingwelcome';
		config._url = 'http://staging.localhost:9897';
  }	else if(env == 'prepod'){
		//Initialize the config for prepod
		config.username = 'prepodadmin1';
		config.password = 'prepodwelcome';
		config._url = 'http://prepod.localhost:9897';
  } else if(env == 'prod'){
		//Initialize the config for prod
		config.username = 'prodadmin1';
		config.password = 'prodwelcome';
		config._url = 'http://prod.localhost:9897';
  }
	
  return config;
}
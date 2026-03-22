function fn() {
  var config = {
    baseUrl: 'https://serverest.dev',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json'
    }
  };

  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  return config;
}

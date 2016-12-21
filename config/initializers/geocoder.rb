Geocoder.configure(
  # Geocoding options
  # timeout: 3,                 # geocoding service timeout (secs)
  lookup: :google,
  # language: :en,              # ISO-639 language code
  use_https: true,
  # http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  # https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
  api_key: "AIzaSyC-wAedLfuL0968lyVC1gb1iLdkKXpIonU",
  # cache: nil,                 # cache object (must respond to #[], #[]=, and #keys)
  cache_prefix: "geocoder:",

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # Calculation options
  units: :km,                 # :km for kilometers or :mi for miles
  distances: :spherical       # :spherical or :linear
)

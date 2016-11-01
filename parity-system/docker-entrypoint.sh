#!/bin/sh

cat > /opt/parity/parity-system.conf <<-EOF
market-data {
  session             = parity
  multicast-interface = 127.0.0.1
  multicast-group     = 224.0.0.1
  multicast-port      = 5000
  request-port        = 5001
}

market-report {
  session             = parity
  multicast-interface = 127.0.0.1
  multicast-group     = 224.0.0.1
  multicast-port      = 6000
  request-port        = 6001
}

order-entry {
  address = 0.0.0.0
  port    = 4000
}

instruments = [ ${PARITY_SYSTEM_INSTRUMENTS:-"FOO,BAR,BAZ"} ]
EOF

exec /usr/bin/supervisord --configuration /etc/supervisord.conf

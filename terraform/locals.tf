locals {
    userdata                   = <<EOF
    #!/bin/bash

    # Update SO
    sudo yum update -y

    # Install Nginx
    sudo yum install nginx -y

    # Back up existing config
    #mv /etc/nginx /etc/nginx-backup

    # Install new configuration
    #unzip /tmp/nginxconfig.io-example.com.zip -d /etc/nginx

    #Creation of new relic agent
    # Create a configuration file and add your license key \
    echo "license_key: 6a0107e22bbd5102f1d18c38b3cbc80ed045NRAL" | sudo tee -a /etc/newrelic-infra.yml && \
    \
    # Create the agent's yum repository \
    sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo && \
    \
    # Update your yum cache \
    sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra' && \
    \
    # Run the installation script \
    sudo yum install newrelic-infra -y

EOF
}
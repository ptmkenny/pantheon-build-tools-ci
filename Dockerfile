ARG PHPVERSION=7.4

# https://github.com/pantheon-systems/docker-build-tools-ci/tree/7.x
FROM quay.io/pantheon-public/build-tools-ci:7.x-php${PHPVERSION}

# Switch to root user
USER root

# Install gulp
RUN npm install -g gulp

# Install pa11y-ci
# https://github.com/puppeteer/puppeteer/issues/375#issuecomment-363466257
RUN npm install -g pa11y-ci --unsafe-perm=true

# Install lighthouse
RUN npm install -g lighthouse
RUN npm install -g @lhci/cli
RUN npm install -g lighthouse-batch
RUN npm install -g lighthouse-ci
RUN npm install -g circle-github-bot

# Install puppeteer for control of lighthouse
RUN npm install -g puppeteer --unsafe-perm=true
RUN npm install -g chrome-launcher

RUN apt-get update && \
     apt-get install -y \
        vim \
        iputils-ping

# Add Behat for more functional testing
# CUSTOM: Use Drupal Extension 4 + bex for screenshots.
RUN mkdir ~/behat && \
    cd ~/behat && \
    COMPOSER_BIN_DIR=/usr/local/bin \
    composer require \
        "drupal/drupal-extension:^4.1" \
        "drupal/drupal-driver:^2.1" \
        "genesis/behat-fail-aid:^3.5"
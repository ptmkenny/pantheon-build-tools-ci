# pantheon-build-tools-ci
Add pa11y, lighthouse, gulp, and other tools for CI on pantheon

# Build it
docker build -t ptmkenny/pantheon-build-tools-ci --build-arg PHPVERSION=7.4 .
docker push ptmkenny/pantheon-build-tools-ci
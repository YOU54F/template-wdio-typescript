DOCKERIMGNAME=wdiodocker
DOCKERRUNCMD=docker-compose run --rm $(DOCKERIMGNAME)

# Docker Related Commands
dockerbuild:
	docker build . -t wdiodocker
dockertag:
	docker tag wdiodocker you54f/wdiodocker
dockerpush:
	docker push you54f/wdiodocker:latest
dockerremovelocal:
	docker rmi wdiodocker
dockerremoveremote:
	docker rmi you54f/wdiodocker

# Test Related Commands
build:
	$(DOCKERRUNCMD) yarn run build
pretest:
	$(DOCKERRUNCMD) yarn run clean-build
clean:
	$(DOCKERRUNCMD) yarn run clean

# Test Related Commands
test-local:
	$(DOCKERRUNCMD) yarn run test-local
test-sauce:
	$(DOCKERRUNCMD) yarn run test-sauce
test-browserstack:
	$(DOCKERRUNCMD) yarn run test-browserstack
test-testingbot:
	$(DOCKERRUNCMD) yarn run test-testingbot

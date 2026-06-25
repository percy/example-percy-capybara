NPM=node_modules/.bin

.PHONY: install clean test test-advanced test-advanced-ci

$(NPM):
	npm install --no-save @percy/cli@^1.31.13

bundle:
	bundle config set path 'vendor/bundle'
	bundle install

install: $(NPM) bundle

clean:
	rm -rf vendor node_modules .bundle advanced-requests.json

test test-advanced: install
	$(NPM)/percy exec -- bundle exec rspec spec/

test-advanced-ci: install
	PERCY_TOKEN=fake_token $(NPM)/percy exec --testing -- bash -c '\
		bundle exec rspec spec/; \
		ec=$$?; \
		curl -fsS http://localhost:5338/test/requests > advanced-requests.json || true; \
		exit $$ec'

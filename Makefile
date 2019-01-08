serve:
	hugo server \
		--buildDrafts \
		--buildFuture \
		--bind 0.0.0.0 \
		--disableFastRender

production-build:
	hugo

preview-build:
	hugo \
		--buildDrafts \
		--buildFuture \
		--baseURL $(DEPLOY_PRIME_URL)

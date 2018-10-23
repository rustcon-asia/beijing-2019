serve:
	hugo server \
		--buildDrafts \
		--buildFuture \
		--disableFastRender \
		--ignoreCache

production-build:
	hugo

preview-build:
	hugo \
		--buildDrafts \
		--buildFuture \
		--baseURL $(DEPLOY_PRIME_URL)

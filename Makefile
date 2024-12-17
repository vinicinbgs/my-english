generate-cm:
	@echo "Generating cm file"
	kubectl create configmap cm-my-english -n nm-my-english \
	--from-file=index.html \
	--from-file=styles.css \
	--from-file=default.conf \
	-o yaml --dry-run=client \
	| \
	sed '/creationTimestamp: null/d' > k8s/configmap.yaml

apply:
	@echo "Applying on Cluster"
	kubectl apply -f k8s
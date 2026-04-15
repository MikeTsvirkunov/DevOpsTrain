tofu -chdir="$OPENTOFU_WORKING_DIR" init -upgrade
tofu -chdir="$OPENTOFU_WORKING_DIR" plan -no-color
tofu -chdir="$OPENTOFU_WORKING_DIR" taint twc_server.main-server
tofu -chdir="$OPENTOFU_WORKING_DIR" taint twc_server.main-argocd-node-server
tofu -chdir="$OPENTOFU_WORKING_DIR" apply -auto-approve -lock-timeout=360s
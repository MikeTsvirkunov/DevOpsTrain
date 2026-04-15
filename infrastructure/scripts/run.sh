tofu -chdir="$OPENTOFU_WORKING_DIR/maintf" init -upgrade
tofu -chdir="$OPENTOFU_WORKING_DIR/maintf" plan -no-color
tofu -chdir="$OPENTOFU_WORKING_DIR/maintf" taint twc_server.main-server
tofu -chdir="$OPENTOFU_WORKING_DIR/maintf" taint twc_server.main-argocd-node-server
tofu -chdir="$OPENTOFU_WORKING_DIR/maintf" apply -auto-approve -lock-timeout=360s
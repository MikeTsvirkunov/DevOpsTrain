tofu -chdir="$OPENTOFU_WORKING_DIR/main.tf" init -upgrade
tofu -chdir="$OPENTOFU_WORKING_DIR/main.tf" plan -no-color
tofu -chdir="$OPENTOFU_WORKING_DIR/main.tf" taint twc_server.main-server
tofu -chdir="$OPENTOFU_WORKING_DIR/main.tf" taint twc_server.main-argocd-node-server
tofu -chdir="$OPENTOFU_WORKING_DIR/main.tf" apply -auto-approve -lock-timeout=360s
kubectl create secret generic on-demand-secrets \
  --from-literal=SERVER_NAME="localhost" \
  --from-literal=OIDC_CLIENT_ID= \
  --from-literal=OIDC_CLIENT_SECRET= \
  --from-literal=OIDC_LOGOUT_REDIRECT="http://localhost/oidc/redirect_uri" \
  --namespace=petar

  this is how you setup secrets
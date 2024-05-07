kubectl create secret generic on-demand-secrets \
  --from-literal=SERVER_NAME=your.server.name \
  --from-literal=OIDC_CLIENT_ID=your-client-id \
  --from-literal=OIDC_CLIENT_SECRET=your-client-secret \
  --from-literal=OIDC_LOGOUT_REDIRECT=your-logout-redirect-url \
  --namespace=petar

  this is how you setup secrets
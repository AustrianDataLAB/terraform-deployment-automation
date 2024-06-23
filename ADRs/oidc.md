
# Google OIDC for authentication

## Status

Accepted

## Context

To make a deployment of the OOD service possible, there needs to be some sort of (authentication)[https://osc.github.io/ood-documentation/latest/authentication.html]

## Decision

We decided to use Google OIDC, since its easy to setup and Google accounts are very popular. 

## Consequences

Pros: easy to setup and manage auth user. Cons: no mapping with OpenStack, so will need to be replaced in the future with the same OIDC provider as is used in the OpenStack deployment.



# Kubernetes Ingress over Cilium

## Status

Accepted

## Context

In order to make our service public, we needed to use some networking framework to deploy it on a cluster.

## Decision

First choice was to use Cilium, but after multiple days of struggle we opted for an easier option - Kubernetes Ingress.

## Consequences

Both development and deployment became much smoother, as Ingress is less complicated and better documented.

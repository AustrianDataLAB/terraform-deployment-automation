
# Usage of Coder to facilitate terraform deployments

## Status

Accepted

## Context

The need for a Terraform automation/pipeline tool to facilitate Terraform deployments.

## Decision

We decided to use Coder for this. The alternative was to use our own Terraform pipeline implementation. 
 
## Consequences

This removed the struggle to make the Terraform pipelines safe, the need for our own authentication service and also deployment became easier, as Coder supports Docker deployments.


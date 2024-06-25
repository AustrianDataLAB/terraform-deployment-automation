# Terraform Deployment Automation
The project aims to extend Open OnDemand functionality by adding support of launching applications in automatically created infrastructure according to the needs of the aplication.
It should effectively allow support for provisioning Openstack, which was disscussed by the OOD dev team, but never made to production https://discourse.openondemand.org/t/cloud-vm-support-openstack/861.

## Value proposition
As a user of Open OnDemand app, I want to generate a fresh cloud infrastructure on my OpenStack in a few easy steps, so I can do my work on them or run some interactive jobs (ie. Jupyter notebook, Rstudio).

## Target audience
Organizations utilizing Open OnDemand to provide access to their supercomputers to the users.

## How to use
1. Clone the repository
2. `helm upgrade --install $HELM_RELEASE_NAME ./manifests/mychart --namespace $NAMESPACE --create-namespace`
3. Create a coder template based on the coder/ folder inside the coder UI
4. Based on https://github.com/andrejcermak/bc_openstack and https://osc.github.io/ood-documentation/latest/tutorials/tutorials-interactive-apps.html add template information 
5. In OOD: Interactive Apps -> OpenStack via Coder -> Launch should create a OpenStack VM based on the template specification

This repo contains example Terraform code for Google Cloud, focusing on setup and integrations with Google Cloud VMware Engine (GCVE). Each example will be in a sub-directory, and will have an associated blog post at [https://networkbrouhaha.com](https://networkbrouhaha.com).

# Before you begin

It will be helpful to have some basic knowledge of GitHub, [Terraform](https://www.terraform.io/), [Google Cloud](https://cloud.google.com/), and [GCVE](https://cloud.google.com/vmware-engine). "Getting started" resources for these platforms are listed below:

* [GitHub - Hello World](https://guides.github.com/activities/hello-world/)
* [Terraform - Getting Started](https://learn.hashicorp.com/terraform)
* [Terraform - Getting Started - Google Cloud](https://learn.hashicorp.com/collections/terraform/gcp-get-started)
* [Getting Started with Google Cloud Platform](https://cloud.google.com/gcp/getting-started)
* [Google Cloud VMware Engine](https://cloud.google.com/vmware-engine/docs) Documentation

# Examples

* `gcve-vpc-peering` - Creates a VPC network, subnet, and additional configuration that is ready to peer with a Google Cloud VMware Engine (GCVE) environment
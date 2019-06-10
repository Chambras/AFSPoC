# Accenture Federal POC

## Pre-requists

It is assumed that you have azure CLI installed and configured.
More information on this topic [here](https://docs.microsoft.com/en-us/azure/terraform/terraform-overview).

### versions
* az cli => 2.0.66
* Terraform => 0.12.1
* Azure provider 1.30.1

## Usage
Just run these commands to initialize terraform, get a plan and approve it to apply it.

```
terraform init
terraform plan
terraform apply
```

## Clean resources
It will destroy everything that was created.
```
terraform destroy --force
```

## Caution
Be aware that by running this script your account might get billed.
Also it is recommended to use a remote state instead of a local one.
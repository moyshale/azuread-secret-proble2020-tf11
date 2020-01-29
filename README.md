# Play with azuread_application and sp and passwords

Reproduce problem with azuread provider and terraform 11 not updating azuread_service_principal_password when used with lifecycle ignore_changes = [end_date]

## references
* https://github.com/terraform-providers/terraform-provider-azuread/issues/209

## background

* create app
* create service principle to use with app
* set password of the SP using random GUID
* and more (not relevant to problem)

### Terraform Notes
1. random_uuid main_pass get regenerated but azuread_service_principal_password main is not updated.
1. works with terraform 12 but not terraform 11
1. works without ignore_changes = [end_date] for both tf 11 and 12.

### how to use
* tf11 folder has terraform 11 syntax
* tf12 has terraform 12 syntax
* cd tf??
* use appropriate terraform version 
  * `terraform11`
  * `terraform12`
```
terraform init
terrarofm plan
terraform apply
```


### reproduced with
```
terraform1114 providers --version
Terraform v0.11.14
+ provider.azuread v0.7.0
+ provider.azurerm v1.41.0
+ provider.random v2.2.1

```

### ok with
```
terraform12 providers --version
Terraform v0.12.3
+ provider.azuread v0.7.0
+ provider.azurerm v1.41.0
+ provider.random v2.2.1

Your version of Terraform is out of date! The latest version
is 0.12.20. You can update by downloading from www.terraform.io/downloads.html
```

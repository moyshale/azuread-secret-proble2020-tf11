# tf12 azuread application principal password with lifecycle ignore_changes end_date
* works fine in all 4 cases
  1. end_date
  1. end_date + local var
  1. end_date + depends_on
  1. NO end_date lifecycle
  
## apply first
```
HOST:tf12 USER$ terraform12 apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azuread_application.main will be created
  + resource "azuread_application" "main" {
      + application_id             = (known after apply)
      + available_to_other_tenants = false
      + homepage                   = (known after apply)
      + id                         = (known after apply)
      + identifier_uris            = (known after apply)
      + name                       = "misha-test-sp-tf12"
      + oauth2_allow_implicit_flow = true
      + object_id                  = (known after apply)
      + owners                     = (known after apply)
      + public_client              = (known after apply)
      + reply_urls                 = (known after apply)
      + type                       = "webapp/api"

      + oauth2_permissions {
          + admin_consent_description  = (known after apply)
          + admin_consent_display_name = (known after apply)
          + id                         = (known after apply)
          + is_enabled                 = (known after apply)
          + type                       = (known after apply)
          + user_consent_description   = (known after apply)
          + user_consent_display_name  = (known after apply)
          + value                      = (known after apply)
        }
    }

  # azuread_service_principal.main will be created
  + resource "azuread_service_principal" "main" {
      + application_id = (known after apply)
      + display_name   = (known after apply)
      + id             = (known after apply)
      + object_id      = (known after apply)

      + oauth2_permissions {
          + admin_consent_description  = (known after apply)
          + admin_consent_display_name = (known after apply)
          + id                         = (known after apply)
          + is_enabled                 = (known after apply)
          + type                       = (known after apply)
          + user_consent_description   = (known after apply)
          + user_consent_display_name  = (known after apply)
          + value                      = (known after apply)
        }
    }

  # azuread_service_principal_password.main will be created
  + resource "azuread_service_principal_password" "main" {
      + end_date             = (known after apply)
      + id                   = (known after apply)
      + key_id               = (known after apply)
      + service_principal_id = (known after apply)
      + start_date           = (known after apply)
      + value                = (sensitive value)
    }

  # azuread_service_principal_password.main_dependson will be created
  + resource "azuread_service_principal_password" "main_dependson" {
      + end_date             = (known after apply)
      + id                   = (known after apply)
      + key_id               = (known after apply)
      + service_principal_id = (known after apply)
      + start_date           = (known after apply)
      + value                = (sensitive value)
    }

  # azuread_service_principal_password.main_local will be created
  + resource "azuread_service_principal_password" "main_local" {
      + end_date             = (known after apply)
      + id                   = (known after apply)
      + key_id               = (known after apply)
      + service_principal_id = (known after apply)
      + start_date           = (known after apply)
      + value                = (sensitive value)
    }

  # azuread_service_principal_password.main_no_ignorechanges will be created
  + resource "azuread_service_principal_password" "main_no_ignorechanges" {
      + end_date             = (known after apply)
      + id                   = (known after apply)
      + key_id               = (known after apply)
      + service_principal_id = (known after apply)
      + start_date           = (known after apply)
      + value                = (sensitive value)
    }

  # random_uuid.main_pass will be created
  + resource "random_uuid" "main_pass" {
      + id      = (known after apply)
      + keepers = (known after apply)
      + result  = (known after apply)
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_uuid.main_pass: Creating...
random_uuid.main_pass: Creation complete after 0s [id=SECRET1]
azuread_application.main: Creating...
azuread_application.main: Still creating... [10s elapsed]
azuread_application.main: Creation complete after 12s [id=APPIDTF
azuread_service_principal.main: Creating...
azuread_service_principal.main: Still creating... [10s elapsed]
azuread_service_principal.main: Creation complete after 13s [id=SPID]
azuread_service_principal_password.main_dependson: Creating...
azuread_service_principal_password.main_no_ignorechanges: Creating...
azuread_service_principal_password.main_local: Creating...
azuread_service_principal_password.main: Creating...
azuread_service_principal_password.main_local: Still creating... [10s elapsed]
azuread_service_principal_password.main_dependson: Still creating... [10s elapsed]
azuread_service_principal_password.main_no_ignorechanges: Still creating... [10s elapsed]
azuread_service_principal_password.main: Still creating... [10s elapsed]
azuread_service_principal_password.main_local: Creation complete after 11s [id=SPID/SECRET2]
azuread_service_principal_password.main_no_ignorechanges: Still creating... [20s elapsed]
azuread_service_principal_password.main_dependson: Still creating... [20s elapsed]
azuread_service_principal_password.main: Still creating... [20s elapsed]
azuread_service_principal_password.main_no_ignorechanges: Creation complete after 22s [id=SPID/SECRET5]
azuread_service_principal_password.main_dependson: Still creating... [30s elapsed]
azuread_service_principal_password.main: Still creating... [30s elapsed]
azuread_service_principal_password.main_dependson: Creation complete after 33s [id=SPID/SECRET3]
azuread_service_principal_password.main: Still creating... [40s elapsed]
azuread_service_principal_password.main: Creation complete after 44s [id=SPID/SECRET4]

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

app_id = APPID
secrect = SECRET1
```

## apply in after 2 min
```
HOST:tf12 USER$ terraform12 apply
random_uuid.main_pass: Refreshing state... [id=SECRET1]
azuread_application.main: Refreshing state... [id=APPIDTF
azuread_service_principal.main: Refreshing state... [id=SPID]
azuread_service_principal_password.main_dependson: Refreshing state... [id=SPID/SECRET3]
azuread_service_principal_password.main: Refreshing state... [id=SPID/SECRET4]
azuread_service_principal_password.main_local: Refreshing state... [id=SPID/SECRET2]
azuread_service_principal_password.main_no_ignorechanges: Refreshing state... [id=SPID/SECRET5]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
+/- create replacement and then destroy

Terraform will perform the following actions:

  # azuread_service_principal_password.main must be replaced
+/- resource "azuread_service_principal_password" "main" {
      ~ end_date             = "2020-01-22T22:42:10Z" -> (known after apply)
      ~ id                   = "SPID/SECRET4" -> (known after apply)
      ~ key_id               = "SECRET4" -> (known after apply)
        service_principal_id = "SPID"
      ~ start_date           = "2020-01-22T22:40:43Z" -> (known after apply)
      ~ value                = (sensitive value)
    }

  # azuread_service_principal_password.main_dependson must be replaced
+/- resource "azuread_service_principal_password" "main_dependson" {
      ~ end_date             = "2020-01-22T22:42:10Z" -> (known after apply)
      ~ id                   = "SPID/SECRET3" -> (known after apply)
      ~ key_id               = "SECRET3" -> (known after apply)
        service_principal_id = "SPID"
      ~ start_date           = "2020-01-22T22:40:32Z" -> (known after apply)
      ~ value                = (sensitive value)
    }

  # azuread_service_principal_password.main_local must be replaced
+/- resource "azuread_service_principal_password" "main_local" {
      ~ end_date             = "2020-01-22T22:42:10Z" -> (known after apply)
      ~ id                   = "SPID/SECRET2" -> (known after apply)
      ~ key_id               = "SECRET2" -> (known after apply)
        service_principal_id = "SPID"
      ~ start_date           = "2020-01-22T22:40:10Z" -> (known after apply)
      ~ value                = (sensitive value)
    }

  # azuread_service_principal_password.main_no_ignorechanges must be replaced
+/- resource "azuread_service_principal_password" "main_no_ignorechanges" {
      ~ end_date             = "2020-01-22T22:42:10Z" -> (known after apply) # forces replacement
      ~ id                   = "SPID/SECRET5" -> (known after apply)
      ~ key_id               = "SECRET5" -> (known after apply)
        service_principal_id = "SPID"
      ~ start_date           = "2020-01-22T22:40:21Z" -> (known after apply)
      ~ value                = (sensitive value)
    }

  # random_uuid.main_pass must be replaced
+/- resource "random_uuid" "main_pass" {
      ~ id      = "SECRET1" -> (known after apply)
      ~ keepers = {
          - "timestamp" = "2020-01-22T22:39:4"
        } -> (known after apply) # forces replacement
      ~ result  = "SECRET1" -> (known after apply)
    }

Plan: 5 to add, 0 to change, 5 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_uuid.main_pass: Creating...
random_uuid.main_pass: Creation complete after 0s [id=SECRET2]
azuread_service_principal_password.main_local: Creating...
azuread_service_principal_password.main: Creating...
azuread_service_principal_password.main_dependson: Creating...
azuread_service_principal_password.main_no_ignorechanges: Creating...
azuread_service_principal_password.main: Still creating... [10s elapsed]
azuread_service_principal_password.main_dependson: Still creating... [10s elapsed]
azuread_service_principal_password.main_no_ignorechanges: Still creating... [10s elapsed]
azuread_service_principal_password.main_local: Still creating... [10s elapsed]
azuread_service_principal_password.main_local: Creation complete after 11s [id=SPID/SECRET6]
azuread_service_principal_password.main_local: Destroying... [id=SPID/SECRET2]
azuread_service_principal_password.main: Still creating... [20s elapsed]
azuread_service_principal_password.main_no_ignorechanges: Still creating... [20s elapsed]
azuread_service_principal_password.main_dependson: Still creating... [20s elapsed]
azuread_service_principal_password.main_local: Still destroying... [id=SPID/SECRET2, 10s elapsed]
azuread_service_principal_password.main: Creation complete after 22s [id=SPID/SECRET7]
azuread_service_principal_password.main: Destroying... [id=SPID/SECRET4]
azuread_service_principal_password.main_dependson: Still creating... [30s elapsed]
azuread_service_principal_password.main_no_ignorechanges: Still creating... [30s elapsed]
azuread_service_principal_password.main_local: Still destroying... [id=SPID/SECRET2, 20s elapsed]
azuread_service_principal_password.main: Still destroying... [id=SPID/SECRET4, 10s elapsed]
azuread_service_principal_password.main_dependson: Creation complete after 33s [id=SPID/SECRET10]
azuread_service_principal_password.main_dependson: Destroying... [id=SPID/SECRET3]
azuread_service_principal_password.main_no_ignorechanges: Still creating... [40s elapsed]
azuread_service_principal_password.main_local: Still destroying... [id=SPID/SECRET2, 30s elapsed]
azuread_service_principal_password.main: Still destroying... [id=SPID/SECRET4, 20s elapsed]
azuread_service_principal_password.main_dependson: Still destroying... [id=SPID/SECRET3, 10s elapsed]
azuread_service_principal_password.main_no_ignorechanges: Creation complete after 44s [id=SPID/SECRET11]
azuread_service_principal_password.main_no_ignorechanges: Destroying... [id=SPID/SECRET5]
azuread_service_principal_password.main_local: Destruction complete after 34s
azuread_service_principal_password.main: Destruction complete after 23s
azuread_service_principal_password.main_dependson: Destruction complete after 13s
azuread_service_principal_password.main_no_ignorechanges: Destruction complete after 3s
random_uuid.main_pass: Destroying... [id=SECRET1]
random_uuid.main_pass: Destruction complete after 0s

Apply complete! Resources: 5 added, 0 changed, 5 destroyed.

Outputs:

app_id = APPID
secrect = SECRET2
```

## providers
```
HOST:tf12 USER$ terraform12 providers --version
Terraform v0.12.3
+ provider.azuread v0.7.0
+ provider.azurerm v1.41.0
+ provider.random v2.2.1

Your version of Terraform is out of date! The latest version
is 0.12.20. You can update by downloading from www.terraform.io/downloads.html
```
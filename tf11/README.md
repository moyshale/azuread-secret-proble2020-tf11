# tf11 azuread application principal password with lifecycle ignore_changes end_date
  * Only works in 1 out 4
  1. NO end_date lifecycle

* Does NOT work in 3 out of 4
  1. end_date
  1. end_date + local var
  1. end_date + depends_on


The only so far solution to taint the secret password resource

```
HOST:tf11 USER$ terraform1114 taint azuread_service_principal_password.main
The resource azuread_service_principal_password.main in the module root has been marked as tainted!
```

and run apply

## initial run
```
HOST:tf11 USER$ terraform1114 apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + azuread_application.main
      id:                         <computed>
      application_id:             <computed>
      available_to_other_tenants: "false"
      homepage:                   <computed>
      identifier_uris.#:          <computed>
      name:                       "misha-test-sp-tf11"
      oauth2_allow_implicit_flow: "true"
      oauth2_permissions.#:       <computed>
      object_id:                  <computed>
      owners.#:                   <computed>
      public_client:              <computed>
      reply_urls.#:               <computed>
      type:                       "webapp/api"

  + azuread_service_principal.main
      id:                         <computed>
      application_id:             "${azuread_application.main.application_id}"
      display_name:               <computed>
      oauth2_permissions.#:       <computed>
      object_id:                  <computed>

  + azuread_service_principal_password.main
      id:                         <computed>
      end_date:                   "2020-01-22T22:20:30Z"
      key_id:                     <computed>
      service_principal_id:       "${azuread_service_principal.main.id}"
      start_date:                 <computed>
      value:                      <sensitive>

  + azuread_service_principal_password.main_local
      id:                         <computed>
      end_date:                   "2020-01-22T22:20:30Z"
      key_id:                     <computed>
      service_principal_id:       "${azuread_service_principal.main.id}"
      start_date:                 <computed>
      value:                      <sensitive>

  + azuread_service_principal_password.main_no_ignorechanges
      id:                         <computed>
      end_date:                   "2020-01-22T22:20:30Z"
      key_id:                     <computed>
      service_principal_id:       "${azuread_service_principal.main.id}"
      start_date:                 <computed>
      value:                      <sensitive>

  + azuread_service_principal_password.main_with_dependson
      id:                         <computed>
      end_date:                   "2020-01-22T22:20:30Z"
      key_id:                     <computed>
      service_principal_id:       "${azuread_service_principal.main.id}"
      start_date:                 <computed>
      value:                      <sensitive>

  + random_uuid.main_pass
      id:                         <computed>
      keepers.%:                  "1"
      keepers.timestamp:          "2020-01-22T22:18:3"
      result:                     <computed>


Plan: 7 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_uuid.main_pass: Creating...
  keepers.%:         "" => "1"
  keepers.timestamp: "" => "2020-01-22T22:18:3"
  result:            "" => "<computed>"
random_uuid.main_pass: Creation complete after 0s (ID: SECRET0)
azuread_application.main: Creating...
  application_id:             "" => "<computed>"
  available_to_other_tenants: "" => "false"
  homepage:                   "" => "<computed>"
  identifier_uris.#:          "" => "<computed>"
  name:                       "" => "misha-test-sp-tf11"
  oauth2_allow_implicit_flow: "" => "true"
  oauth2_permissions.#:       "" => "<computed>"
  object_id:                  "" => "<computed>"
  owners.#:                   "" => "<computed>"
  public_client:              "" => "<computed>"
  reply_urls.#:               "" => "<computed>"
  type:                       "" => "webapp/api"
azuread_application.main: Still creating... (10s elapsed)
azuread_application.main: Creation complete after 12s (ID: APPIDTF)
azuread_service_principal.main: Creating...
  application_id:       "" => "APPID"
  display_name:         "" => "<computed>"
  oauth2_permissions.#: "" => "<computed>"
  object_id:            "" => "<computed>"
azuread_service_principal.main: Still creating... (10s elapsed)
azuread_service_principal.main: Creation complete after 12s (ID: SPID)
azuread_service_principal_password.main_with_dependson: Creating...
  end_date:             "" => "2020-01-22T22:20:56Z"
  key_id:               "" => "<computed>"
  service_principal_id: "" => "SPID"
  start_date:           "" => "<computed>"
  value:                "<sensitive>" => "<sensitive>"
azuread_service_principal_password.main: Creating...
  end_date:             "" => "2020-01-22T22:20:56Z"
  key_id:               "" => "<computed>"
  service_principal_id: "" => "SPID"
  start_date:           "" => "<computed>"
  value:                "<sensitive>" => "<sensitive>"
azuread_service_principal_password.main_local: Creating...
  end_date:             "" => "2020-01-22T22:20:56Z"
  key_id:               "" => "<computed>"
  service_principal_id: "" => "SPID"
  start_date:           "" => "<computed>"
  value:                "<sensitive>" => "<sensitive>"
azuread_service_principal_password.main_no_ignorechanges: Creating...
  end_date:             "" => "2020-01-22T22:20:56Z"
  key_id:               "" => "<computed>"
  service_principal_id: "" => "SPID"
  start_date:           "" => "<computed>"
  value:                "<sensitive>" => "<sensitive>"
azuread_service_principal_password.main: Still creating... (10s elapsed)
azuread_service_principal_password.main_local: Still creating... (10s elapsed)
azuread_service_principal_password.main_no_ignorechanges: Still creating... (10s elapsed)
azuread_service_principal_password.main_with_dependson: Still creating... (10s elapsed)
azuread_service_principal_password.main_with_dependson: Creation complete after 11s (ID: SPID/SECRET3)
azuread_service_principal_password.main: Still creating... (20s elapsed)
azuread_service_principal_password.main_local: Still creating... (20s elapsed)
azuread_service_principal_password.main_no_ignorechanges: Still creating... (20s elapsed)
azuread_service_principal_password.main_local: Creation complete after 22s (ID: SPID/SECRET5)
azuread_service_principal_password.main_no_ignorechanges: Still creating... (30s elapsed)
azuread_service_principal_password.main: Still creating... (30s elapsed)
azuread_service_principal_password.main: Creation complete after 33s (ID: SPID/SECRET4)
azuread_service_principal_password.main_no_ignorechanges: Still creating... (40s elapsed)
azuread_service_principal_password.main_no_ignorechanges: Creation complete after 44s (ID: SPID/SECRET2)

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

app_id = APPID
secrect = SECRET0
```

## next run should expire
only azuread_service_principal_password.main_no_ignorechanges will update

```
HOST:tf11 USER$ terraform1114 plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

random_uuid.main_pass: Refreshing state... (ID: SECRET0)
azuread_application.main: Refreshing state... (ID: APPIDTF)
azuread_service_principal.main: Refreshing state... (ID: SPID)
azuread_service_principal_password.main_no_ignorechanges: Refreshing state... (ID: SPID/SECRET2)
azuread_service_principal_password.main_with_dependson: Refreshing state... (ID: SPID/SECRET3)
azuread_service_principal_password.main: Refreshing state... (ID: SPID/SECRET4)
azuread_service_principal_password.main_local: Refreshing state... (ID: SPID/SECRET5)

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

-/+ azuread_service_principal_password.main_no_ignorechanges (new resource required)
      id:                   "SPID/SECRET2" => <computed> (forces new resource)
      end_date:             "2020-01-22T22:20:56Z" => "2020-01-22T22:23:09Z" (forces new resource)
      key_id:               "SECRET2" => <computed>
      service_principal_id: "SPID" => "SPID"
      start_date:           "2020-01-22T22:19:30Z" => <computed>
      value:                <sensitive> => <sensitive> (forces new resource)

-/+ random_uuid.main_pass (new resource required)
      id:                   "SECRET0" => <computed> (forces new resource)
      keepers.%:            "1" => "1"
      keepers.timestamp:    "2020-01-22T22:18:3" => "2020-01-22T22:21:0" (forces new resource)
      result:               "SECRET0" => <computed>


Plan: 2 to add, 0 to change, 2 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

## apply after taint
```
HOST:tf11 USER$ terraform1114 taint azuread_service_principal_password.main
The resource azuread_service_principal_password.main in the module root has been marked as tainted!
HOST:tf11 USER$ terraform1114 apply
random_uuid.main_pass: Refreshing state... (ID: RANDOMUUID)
azuread_application.main: Refreshing state... (ID: APPIDTF)
azuread_service_principal.main: Refreshing state... (ID: SPID)
azuread_service_principal_password.main_with_dependson: Refreshing state... (ID: SPID/SECRET3)
azuread_service_principal_password.main_no_ignorechanges: Refreshing state... (ID: SPID/SECRET8)
azuread_service_principal_password.main: Refreshing state... (ID: SPID/SECRET4)
azuread_service_principal_password.main_local: Refreshing state... (ID: SPID/SECRET5)

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

-/+ azuread_service_principal_password.main (tainted) (new resource required)
      id:                   "SPID/SECRET4" => <computed> (forces new resource)
      end_date:             "2020-01-22T22:20:56Z" => "2020-01-22T23:02:40Z" (forces new resource)
      key_id:               "SECRET4" => <computed>
      service_principal_id: "SPID" => "SPID"
      start_date:           "2020-01-22T22:19:19Z" => <computed>
      value:                <sensitive> => <sensitive> (forces new resource)

-/+ azuread_service_principal_password.main_no_ignorechanges (new resource required)
      id:                   "SPID/SECRET8" => <computed> (forces new resource)
      end_date:             "2020-01-22T22:56:11Z" => "2020-01-22T23:02:40Z" (forces new resource)
      key_id:               "SECRET8" => <computed>
      service_principal_id: "SPID" => "SPID"
      start_date:           "2020-01-22T22:54:11Z" => <computed>
      value:                <sensitive> => <sensitive> (forces new resource)

-/+ random_uuid.main_pass (new resource required)
      id:                   "RANDOMUUID" => <computed> (forces new resource)
      keepers.%:            "1" => "1"
      keepers.timestamp:    "2020-01-22T22:54:1" => "2020-01-22T23:00:3" (forces new resource)
      result:               "RANDOMUUID" => <computed>


Plan: 3 to add, 0 to change, 3 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_uuid.main_pass: Creating...
  keepers.%:         "" => "1"
  keepers.timestamp: "" => "2020-01-22T23:00:5"
  result:            "" => "<computed>"
random_uuid.main_pass: Creation complete after 0s (ID: SECRET1)
azuread_service_principal_password.main: Creating...
  end_date:             "" => "2020-01-22T23:02:52Z"
  key_id:               "" => "<computed>"
  service_principal_id: "" => "SPID"
  start_date:           "" => "<computed>"
  value:                "<sensitive>" => "<sensitive>"
azuread_service_principal_password.main_no_ignorechanges: Creating...
  end_date:             "" => "2020-01-22T23:02:52Z"
  key_id:               "" => "<computed>"
  service_principal_id: "" => "SPID"
  start_date:           "" => "<computed>"
  value:                "<sensitive>" => "<sensitive>"
azuread_service_principal_password.main: Still creating... (10s elapsed)
azuread_service_principal_password.main_no_ignorechanges: Still creating... (10s elapsed)
azuread_service_principal_password.main: Creation complete after 11s (ID: SPID/SECRET6)
azuread_service_principal_password.main.deposed: Destroying... (ID: SPID/SECRET4)
azuread_service_principal_password.main_no_ignorechanges: Still creating... (20s elapsed)
azuread_service_principal_password.main (deposed #0): Still destroying... (ID: SPID/SECRET4, 10s elapsed)
azuread_service_principal_password.main_no_ignorechanges: Creation complete after 22s (ID: SPID/SECRET7)
azuread_service_principal_password.main_no_ignorechanges.deposed: Destroying... (ID: SPID/SECRET8)
azuread_service_principal_password.main.deposed: Destruction complete after 12s
azuread_service_principal_password.main_no_ignorechanges.deposed: Destruction complete after 2s
random_uuid.main_pass.deposed: Destroying... (ID: RANDOMUUID)
random_uuid.main_pass.deposed: Destruction complete after 0s

Apply complete! Resources: 3 added, 0 changed, 3 destroyed.

Outputs:

app_id = APPID
secrect = SECRET1
```

## state file
Actually in the example from scratch depends_on set properly but using lifecycle 
```
lifecycle {
        ignore_changes        = ["end_date"]
        create_before_destroy = true
    }
```
seems to stop any updates to password secret in TF 11.

Here is example of depends on for the secrets from state

```
"azuread_service_principal_password.main": {
                    "type": "azuread_service_principal_password",
                    "depends_on": [
                        "azuread_service_principal.main",
                        "random_uuid.main_pass"
                    ],


"azuread_service_principal_password.main_local": {
                    "type": "azuread_service_principal_password",
                    "depends_on": [
                        "azuread_service_principal.main",
                        "local.secret"
                    ],

"azuread_service_principal_password.main_no_ignorechanges": {
                    "type": "azuread_service_principal_password",
                    "depends_on": [
                        "azuread_service_principal.main",
                        "random_uuid.main_pass"
                    ],

"azuread_service_principal_password.main_with_dependson": {
                    "type": "azuread_service_principal_password",
                    "depends_on": [
                        "azuread_service_principal.main",
                        "random_uuid.main_pass"
                    ],

```

## providers
```
HOST:tf11 USER$ terraform1114 providers --version
Terraform v0.11.14
+ provider.azuread v0.7.0
+ provider.azurerm v1.41.0
+ provider.random v2.2.1

Your version of Terraform is out of date! The latest version
is 0.12.20. You can update by downloading from www.terraform.io/downloads.html
```
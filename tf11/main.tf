resource azuread_application main {
    name                       = "misha-test-sp-tf11"
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = true
}

resource azuread_service_principal main {
    application_id = "${azuread_application.main.application_id}"
}

resource random_uuid main_pass {
    keepers {
        timestamp = "${substr(timestamp(), 0, 18)}" # re-generates once per 10 sec
    }
}

resource azuread_service_principal_password main {
    value                = "${random_uuid.main_pass.result}"
    end_date             = "${timeadd(timestamp(), "2m")}"
    service_principal_id = "${azuread_service_principal.main.id}"

    lifecycle {
        ignore_changes        = ["end_date"]
        create_before_destroy = true
    }
}

resource azuread_service_principal_password main_with_dependson {
    value                = "${random_uuid.main_pass.result}"
    end_date             = "${timeadd(timestamp(), "2m")}"
    service_principal_id = "${azuread_service_principal.main.id}"
    depends_on           = ["random_uuid.main_pass"]

    lifecycle {
        ignore_changes        = ["end_date"]
        create_before_destroy = true
    }
}

resource azuread_service_principal_password main_no_ignorechanges {
    value                = "${random_uuid.main_pass.result}"
    end_date             = "${timeadd(timestamp(), "2m")}"
    service_principal_id = "${azuread_service_principal.main.id}"

    lifecycle {
        # ignore_changes        = ["end_date"]
        create_before_destroy = true
    }
}

locals {
    secret = "${random_uuid.main_pass.result}"
}

resource azuread_service_principal_password main_local {
    value                = "${local.secret}"
    end_date             = "${timeadd(timestamp(), "2m")}"
    service_principal_id = "${azuread_service_principal.main.id}"

    lifecycle {
        ignore_changes        = ["end_date"]
        create_before_destroy = true
    }
}

output "app_id" {
  value = "${azuread_application.main.application_id}"
}

output "secrect" {
  value = "${azuread_service_principal_password.main.value}"
}

output "secrect_nolifecycle" {
  value = "${azuread_service_principal_password.main_no_ignorechanges.value}"
}


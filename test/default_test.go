package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestModuleInitAndApply(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/complete",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}

module "foo" {
  source = "github.com/suzuki-shunsuke/test-terraform-module-renovate//modules/foo?ref=module_modules_foo_v0.1.0"
}

module "bar" {
  source = "github.com/suzuki-shunsuke/test-terraform-module-renovate//modules/bar?ref=main"
}

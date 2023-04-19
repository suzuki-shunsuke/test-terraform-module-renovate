module "foo" {
  source = "github.com/suzuki-shunsuke/test-terraform-module-renovate//modules/foo?ref=main"
}

module "bar" {
  source = "github.com/suzuki-shunsuke/test-terraform-module-renovate//modules/bar?ref=main"
}

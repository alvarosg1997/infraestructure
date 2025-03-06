resource "aws_s3_bucket" "terraform_files" {
    bucket                      = "terraform-state-asanchez"
    bucket_prefix               = null
    object_lock_enabled         = false
    tags                        = {}
    tags_all                    = {}
}
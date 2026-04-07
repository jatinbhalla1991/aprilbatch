
resource "aws_instance" "example" {
  for_each      = var.instance_type
  ami           = var.ami_id
  instance_type = each.value

  tags = {
    Name = each.key
  }
}


resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-terraform-2024"

  tags = {
    Name = "ExampleBucket"
  }
}
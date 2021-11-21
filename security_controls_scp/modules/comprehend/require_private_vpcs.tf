#-----security_controls_scp/modules/sagemaker/require_private_vpc.tf----#

data "template_file" "comprehend_require_private_vpc_policy" {
  template = file("${path.module}/templates/require_private_vpcs.json")
}

resource "aws_organizations_policy" "comprehend_require_private_vpc_policy" {
  name        = "Require private VPCs Amazon Comprehend"
  description = "Requires that all Amazon Comprehend jobs use a private VPC."

  content = data.template_file.comprehend_require_private_vpc_policy.rendered
}

resource "aws_organizations_policy_attachment" "comprehend_require_private_vpc_attachment" {
  policy_id = aws_organizations_policy.comprehend_require_private_vpc_policy.id
  target_id = var.target_id
}

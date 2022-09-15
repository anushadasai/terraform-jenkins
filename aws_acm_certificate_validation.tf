resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [
    aws_route53_record.cert_validation-0.fqdn,
    aws_route53_record.cert_validation-1.fqdn,
    aws_route53_record.cert_validation-2.fqdn
  ]
}
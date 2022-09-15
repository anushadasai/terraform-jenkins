resource "aws_route53_record" "cert_validation-0" {
  name     = aws_acm_certificate.cert.domain_validation_options.0.resource_record_name
  type     = aws_acm_certificate.cert.domain_validation_options.0.resource_record_type
  zone_id  = var.hosted-zone
  records  = [aws_acm_certificate.cert.domain_validation_options.0.resource_record_value]
  ttl      = 60
}

resource "aws_route53_record" "cert_validation-1" {
  name     = aws_acm_certificate.cert.domain_validation_options.1.resource_record_name
  type     = aws_acm_certificate.cert.domain_validation_options.1.resource_record_type
  zone_id  = var.hosted-zone
  records  = [aws_acm_certificate.cert.domain_validation_options.1.resource_record_value]
  ttl      = 60
}

resource "aws_route53_record" "cert_validation-2" {
  name     = aws_acm_certificate.cert.domain_validation_options.2.resource_record_name
  type     = aws_acm_certificate.cert.domain_validation_options.2.resource_record_type
  zone_id  = var.hosted-zone
  records  = [aws_acm_certificate.cert.domain_validation_options.2.resource_record_value]
  ttl      = 60
}
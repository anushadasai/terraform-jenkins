resource "kubernetes_ingress" "main" {
  metadata {
    name = "main-ingress"
    annotations = {
      "alb.ingress.kubernetes.io/scheme" = "internet-facing"
      "kubernetes.io/ingress.class" = "alb"
      "alb.ingress.kubernetes.io/subnets" = "${aws_subnet.a.id}, ${aws_subnet.b.id}, ${aws_subnet.c.id}"
      "alb.ingress.kubernetes.io/certificate-arn" = "${aws_acm_certificate.cert.arn}"
      "alb.ingress.kubernetes.io/listen-ports" = <<JSON
[
  {"HTTP": 80},
  {"HTTPS": 443}
]
JSON
      "alb.ingress.kubernetes.io/actions.ssl-redirect" = <<JSON
{
  "Type": "redirect",
  "RedirectConfig": {
    "Protocol": "HTTPS",
    "Port": "443",
    "StatusCode": "HTTP_301"
  }
}
JSON
    }
  }

  spec {
    rule {
      host = "app.example.com"
      http {
        path {
          backend {
            service_name = "ssl-redirect"
            service_port = "use-annotation"
          }
          path = "/*"
        }
        path {
          backend {
            service_name = "app-service1"
            service_port = 80
          }
          path = "/service1"
        }
        path {
          backend {
            service_name = "app-service2"
            service_port = 80
          }
          path = "/service2"
        }
      }
    }

    rule {
      host = "api.example.com"
      http {
        path {
          backend {
            service_name = "ssl-redirect"
            service_port = "use-annotation"
          }
          path = "/*"
        }
        path {
          backend {
            service_name = "api-service1"
            service_port = 80
          }
          path = "/service3"
        }
        path {
          backend {
            service_name = "api-service2"
            service_port = 80
          }
          path = "/graphq4"
        }
      }
    }
  }
}
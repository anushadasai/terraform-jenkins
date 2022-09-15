 resource "kubernetes_service_account" "alb-ingress" {
  metadata {
    name = "alb-ingress-controller"
    namespace = "kube-system"
    labels = {
      "app.kubernetes.io/name" = "alb-ingress-controller"
    }
  }

  automount_service_account_token = true
}

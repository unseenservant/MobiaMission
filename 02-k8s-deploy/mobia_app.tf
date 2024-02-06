resource "kubernetes_namespace" "mobia_app" {
  metadata {
    name = "mobia-app"
  }
}

resource "kubernetes_manifest" "ingress_mobiaapp_ingress" {
  depends_on = [
    kubernetes_namespace.mobia_app
  ]
  manifest = {
    "apiVersion" = "networking.k8s.io/v1"
    "kind" = "Ingress"
    "metadata" = {
      "annotations" = {
        "kubernetes.io/ingress.class" = "gce"
      }
      "name" = "mobiaapp-ingress"
      "namespace" = "mobia-app"
    }
    "spec" = {
      "rules" = [
        {
          "http" = {
            "paths" = [
              {
                "backend" = {
                  "service" = {
                    "name" = "mobiaapp"
                    "port" = {
                      "number" = 80
                    }
                  }
                }
                "path" = "/"
                "pathType" = "Prefix"
              },
            ]
          }
        },
      ]
    }
  }
}


resource "kubernetes_manifest" "service_mobiaapp" {
  depends_on = [
    kubernetes_namespace.mobia_app
  ]
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "name" = "mobiaapp"
      "namespace" = "mobia-app"
    }
    "spec" = {
      "ports" = [
        {
          "port" = 80
          "protocol" = "TCP"
          "targetPort" = 80
        },
      ]
      "selector" = {
        "app" = "mobiaapp"
      }
    }
  }
}


# resource "kubernetes_manifest" "deployment_mobiaapp" {
#   depends_on = [
#     kubernetes_namespace.mobia_app
#   ]
#   manifest = {
#     "apiVersion" = "apps/v1"
#     "kind" = "Deployment"
#     "metadata" = {
#       "name" = "mobiaapp-deployment"
#       "namespace" = "mobia-app"
#     }
#     "spec" = {
#       "replicas" = 1
#       "selector" = {
#         "matchLabels" = {
#           "app" = "mobiaapp"
#         }
#       }
#       "template" = {
#         "metadata" = {
#           "labels" = {
#             "app" = "mobiaapp"
#           }
#         }
#         "spec" = {
#           "containers" = [
#             {
#               "image" = "us-east1-docker.pkg.dev/mobia-mission-aaron/app-mobia/mobiaapp"
#               "name" = "mobiaapp"
#               "ports" = [
#                 {
#                   "containerPort" = 80
#                 },
#               ]
#               "resources" = {
#                 "limits" = {
#                   "cpu" = "250m"
#                   "memory" = "256Mi"
#                 }
#                 "requests" = {
#                   "cpu" = "100m"
#                   "memory" = "128Mi"
#                 }
#               }
#             },
#           ]
#         }
#       }
#     }
#   }
# }

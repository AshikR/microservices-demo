resource "kubernetes_manifest" "project" {
  manifest = yamldecode(
    file("${path.module}/../../k8s/bootstrap/project.yaml")
  )

  depends_on = [
    helm_release.argocd
  ]
}

resource "kubernetes_manifest" "root_app" {
  manifest = yamldecode(
    file("${path.module}/../../k8s/bootstrap/root-app.yaml")
  )

  depends_on = [
    kubernetes_manifest.project
  ]
}

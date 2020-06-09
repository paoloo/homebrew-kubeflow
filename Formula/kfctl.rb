class Kfctl < Formula
  desc "Kubeflow Control"
  homepage "https://www.kubeflow.org"
  url "https://github.com/kubeflow/kfctl/releases/download/v1.0.2/kfctl_v1.0.2-0-ga476281_darwin.tar.gz"
  version "1.0.2-0-ga476281"
  sha256 "14133100d1b8e1c57bc04e2c99efd89697c867daf26113914b39b34aaf2df843"
  head "https://github.com/kubeflow/kfctl.git"

  bottle :unneeded

  depends_on "kubernetes-cli"

  def install
    bin.install "kfctl"
  end

  test do
    ohai "Verify that `kfctl version` contains \"kfctl v#{version}\" ..."
    assert_match "kfctl v#{version}", shell_output("#{bin}/kfctl version 2>&1")

    ohai "Verify that `kfctl --help` contains \"Available Commands\" ..."
    assert_match "Available Commands", shell_output("#{bin}/kfctl --help 2>&1")
  end
end

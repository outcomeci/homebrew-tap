class OutcomeciCli < Formula
  include Language::Python::Virtualenv

  desc "Portable Standup and outcome workflow runtime"
  homepage "https://github.com/outcomeci/cli"
  url "https://files.pythonhosted.org/packages/8e/21/9d125e70737756ffc941b364c1f15b8e168991df48e2187b352eea04c7f8/outcomeci_cli-0.1.0.tar.gz"
  sha256 "359214ef75c57fd7b3a4298529cc08b30618380243a294449fac24bd91439bc9"

  depends_on "python@3.12"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "oci", shell_output("#{bin}/oci --help")
    assert_match version.to_s, shell_output("#{bin}/oci --version")
  end
end

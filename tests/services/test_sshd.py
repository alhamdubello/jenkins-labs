def test_sshd_service_running(host):
    sshd_service = host.service("sshd")
    assert sshd_service.is_running
    assert sshd_service.is_enabled
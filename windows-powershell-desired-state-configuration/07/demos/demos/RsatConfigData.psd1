@{
    AllNodes = @(
        @{
            NodeName    = "Win10"
            RsatInstall = @(
                'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0',
                'Rsat.CertificateServices.Tools~~~~0.0.1.0',
                'Rsat.DHCP.Tools~~~~0.0.1.0',
                'Rsat.Dns.Tools~~~~0.0.1.0',
                'Rsat.FileServices.Tools~~~~0.0.1.0',
                'Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0',
                'Rsat.ServerManager.Tools~~~~0.0.1.0',
                'Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0'
            )
        }
    )
}

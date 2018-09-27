try
{
    # Load WinSCP .NET assembly
    Add-Type -Path "WinSCPnet.dll"

    # Setup session options
    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Sftp
        HostName = "sftp.publicaccessnow.com"
        UserName = "kotip"
        Password = "D|rWy#zugkH0"
        SshHostKeyFingerprint = "ssh-rsa 2048 19:3f:84:e0:a5:e4:20:fc:c4:43:37:24:38:46:f6:3f"
    }

    #ssh-rsa 2048 cgs9MdyPU2T+R32G8rc10HiE8cBgwfnKO75XlV47uOs=
    #ssh-rsa 2048 19:3f:84:e0:a5:e4:20:fc:c4:43:37:24:38:46:f6:3f



    $session = New-Object WinSCP.Session

    try
    {
        # Connect
        $session.Open($sessionOptions)

        # Download files
        $transferOptions = New-Object WinSCP.TransferOptions
        $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary

        $transferResult =
            $session.GetFiles("/users/KotiP/Riverside-SDSupport/Devops/CA-RIV-*-9.1.*", "C:\devops-Backup\Ansible\", $False, $transferOptions)
            $session.GetFiles("/users/KotiP/Riverside-SDSupport/Devops/CA-RIV-*-9.1_**.bak", "C:\devops-Backup\Ansible\", $False, $transferOptions)
   
        # Throw on any error
        $transferResult.Check()

        # Print results
        foreach ($transfer in $transferResult.Transfers)
        {
            Write-Host "Download of $($transfer.FileName) succeeded"
        }
    }
    finally
    {
        # Disconnect, clean up
        $session.Dispose()
    }

    exit 0
}
catch [Exception]
{
    Write-Host "Error: $($_.Exception.Message)"
    exit 1
}

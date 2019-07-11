# An example how to create a powershell cmdlet that returns a value
# I don't know how to avoid appending stdout from the function to a returning value?
function Get-ExeName {
    $result = ""

    # some computations
    $result = "C:\Program Files\expectedName.exe"

    # unwanted output
    Write-Output("stdout output, should NOT be appended to the result!")

    return($result)
}

    ### MAIN ###
    $ExeName=Get-ExeName
    Write-Output("ExeName = `"$ExeName`"")

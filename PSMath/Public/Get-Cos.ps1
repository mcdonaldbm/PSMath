<#
.Synopsis
   Retrieves the "nth" root of the input number
.DESCRIPTION
   Long description
.EXAMPLE
   To take the cosine of a

   PS> Get-Cos 90
.EXAMPLE
   To take the Arccos of a 

   PS> Get-Cos -ArcCos 90
.EXAMPLE
   To take the Hyperbolic cosine of a 
   
   PS> Get-Cos -HyperbolicCos 90
#>
function Get-Cos
{
    [CmdletBinding()]
    Param
    (
        # Item to take the cosine of
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   ValueFromPipeline=$true,
                   Position=0)]
        $number,
        # switch for Arccosine
        [Parameter(Mandatory=$false)]
        $Arc,
        # switch for Hyperbolic Cosine
        [Parameter(Mandatory=$false)]
        $Hyperbolic,
        [Parameter(Mandatory=$false)]
        $toDegrees
    )

    if ($Arc) {
        $result = [math]::acos($number)
    }
    elseif ($Hyperbolic) {
        $result = [math]::cosh($number)
    }
    else {
        $result = [math]::cos($number)
    }

    if($toDegrees) {
        return (($result * 180) / [math]::pi )
    } else {
        return $result
    }

}
param(
    [ValidateSet("formal", "anonymous", "all", "clean")]
    [string]$Mode = "all"
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $scriptDir
$mainTex = Join-Path $projectRoot 'thesis.tex'
$buildDir = Join-Path $projectRoot 'Build'
$tmpDir = Join-Path $buildDir '_tmp'

if (-not (Test-Path $mainTex)) {
    throw "Cannot find thesis.tex in project root."
}

New-Item -ItemType Directory -Force -Path $buildDir, $tmpDir | Out-Null

function Write-Utf8File([string]$Path, [string]$Content) {
    $utf8 = [System.Text.UTF8Encoding]::new($false)
    [System.IO.File]::WriteAllText($Path, $Content, $utf8)
}

function Build-Target([string]$Name, [bool]$Anonymous) {
    $wrapper = Join-Path $tmpDir ("build-" + $Name + ".tex")
    $content = if ($Anonymous) {
        "\\PassOptionsToClass{anonymous}{shtthesis}`n\\input{thesis.tex}`n"
    } else {
        "\\input{thesis.tex}`n"
    }
    Write-Utf8File $wrapper $content

    & latexmk -pdfxe -synctex=1 -interaction=nonstopmode -halt-on-error "-outdir=Build" "-jobname=$Name" $wrapper
    if ($LASTEXITCODE -ne 0) {
        throw "latexmk failed while building $Name"
    }
}

switch ($Mode) {
    'formal' { Build-Target 'formal' $false }
    'anonymous' { Build-Target 'anonymous' $true }
    'all' {
        Build-Target 'formal' $false
        Build-Target 'anonymous' $true
    }
    'clean' {
        if (Test-Path $buildDir) { Remove-Item $buildDir -Recurse -Force }
    }
}
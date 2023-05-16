﻿$here = Split-Path -Parent $MyInvocation.MyCommand.Path

$module = 'Podcast-NoAgenda'

Describe "$module Module Tests"  {

  Context 'Module Setup' {
    It "has the root module $module.psm1" {
      "$here\$module.psm1" | Should Exist
    }

    It "has the a manifest file of $module.psm1" {
      "$here\$module.psd1" | Should Exist
      "$here\$module.psd1" | Should Contain "$module.psm1"
    }

    It '$module folder has functions' {
      "$here\function-*.ps1" | Should Exist
    }

    It "$module is valid PowerShell code" {
      $psFile = Get-Content -Path "$here\$module.psm1" `
                            -ErrorAction Stop
      $errors = $null
      $null = [System.Management.Automation.PSParser]::Tokenize($psFile, [ref]$errors)
      $errors.Count | Should Be 0
    }
  }

  $functions = ('Get-NoAgenda',
                'Get-PodcastData',
                'Get-PodcastMedia',
                'Get-PodcastImage',
                'ConvertTo-PodcastHtml',
                'ConvertTo-PodcastXML',
                'Write-PodcastHtml', 
                'Write-PodcastXML'
               )

  foreach ($function in $functions)
  {
  
    Context "Test Function $function" {
      
      It "$function.ps1 should exist" {
        "$here\function-$function.ps1" | Should Exist
      }
    
      It "$function.ps1 should have help block" {
        "$here\function-$function.ps1" | Should Contain '<#'
        "$here\function-$function.ps1" | Should Contain '#>'
      }

      It "$function.ps1 should have a SYNOPSIS section in the help block" {
        "$here\function-$function.ps1" | Should Contain '.SYNOPSIS'
      }
    
      It "$function.ps1 should have a DESCRIPTION section in the help block" {
        "$here\function-$function.ps1" | Should Contain '.DESCRIPTION'
      }

      It "$function.ps1 should have a EXAMPLE section in the help block" {
        "$here\function-$function.ps1" | Should Contain '.EXAMPLE'
      }
    
      It "$function.ps1 should be an advanced function" {
        "$here\function-$function.ps1" | Should Contain 'function'
        "$here\function-$function.ps1" | Should Contain 'cmdletbinding'
        "$here\function-$function.ps1" | Should Contain 'param'
      }
      
      It "$function.ps1 should contain Write-Verbose blocks" {
        "$here\function-$function.ps1" | Should Contain 'Write-Verbose'
      }
    
      It "$function.ps1 is valid PowerShell code" {
        $psFile = Get-Content -Path "$here\function-$function.ps1" `
                              -ErrorAction Stop
        $errors = $null
        $null = [System.Management.Automation.PSParser]::Tokenize($psFile, [ref]$errors)
        $errors.Count | Should Be 0
      }

    
    } # Context "Test Function $function"
  
  } # foreach ($function in $functions)

}



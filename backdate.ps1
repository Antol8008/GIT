# Backdating Git commits script
$commitCount = 1300
$startDate = Get-Date -Year 2012 -Month 12 -Day 7 # Starting from June 2023
$endDate = Get-Date  # Today's date

# Realistic file names
$fileNames = @(
    "report.md", "notes.txt", "summary.docx", "index.html",
    "config.json",  "data.csv", "project_plan.docx",
    "script.ps1", "analysis.py", "log.txt", "requirements.txt"
)

# Commit messages
$messages = @(
    "Updated project documentation",
    "Fixed bug in data processing script",
    "Added initial project plan",
    "Refactored code for better readability",
    "Enhanced UI responsiveness",
    "Updated README with new features",
    "Improved error handling logic",
    "Optimized database queries",
    "Added validation for user input",
    "Fixed typos in documentation"
)

# Generate commits
for ($i = 1; $i -le $commitCount; $i++) {
    # Generate a random date between the start and end dates
    $randomDate = Get-Random -Minimum $startDate.Ticks -Maximum $endDate.Ticks | ForEach-Object { New-Object DateTime $_ }

    # Format date for Git (ISO 8601 format)
    $commitDate = $randomDate.ToString("yyyy-MM-ddTHH:mm:ss")

    # Pick a random file name and message
    $fileName = $fileNames | Get-Random
    $commitMessage = $messages | Get-Random

    # Make a small change to the repository
    Add-Content -Path $fileName -Value "Temporary commit content $i"

    # Add and commit the file with a backdated timestamp
    git add $fileName
    git commit -m "$commitMessage" --date="$commitDate"
}

Write-Host "Generated $commitCount backdated commits successfully!"

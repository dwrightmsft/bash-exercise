# Notes
# Executive summary
The goal here was to find and fix multiple errors in the supplied script. 7 errors identified, 6 errors fixed, 1 error partially fixed. Committed changes and sent pull request. Notes added in Markdown format to reflect README.MD file. 
# Setting up
Made sense to do this on a Raspberry Pi, but needed to understand Visual Studio Code and GitHub. Watched tutorials: GitHub for beginners: https://www.youtube.com/watch?v=RGOj5yH7evk, using GitHub with Visual Studio Code: https://code.visualstudio.com/docs/editor/github. Was able to set up GitHub account, log in on Raspberry Pi and clone repository so I could work on the script.

# Summary of errors

1. Tried to run but didn’t have access, googled and concluded that I needed to input chmod +x [file name] – did this and it gave me access.
2. Error when running script: [[: not found, weather report pull failed exiting script! Read through code and noticed the double brackets, googled [[: not found bash script, read up on it but wasn’t sure how to fix. Link: https://superuser.com/questions/552016/bash-script-not-found
3.	Read up further on how to write a bash script. Link: https://linuxhandbook.com/run-shell-script/. This is when I saw that the first command to start Bash Script should’ve been #!/bin/bash, not #!/bin/sh once I made that change the error message in point 2 disappeared
4.	Line 11 – 15 (bash: jq: command not found) – searched jq command, JSON. jq not automatically installed in Bash, searched, then installed jq using sudo apt-get install jq, commands then worked
5.	Line 16, country showing as null instead of united kingdom. Checked the URL in a browser and saw that it should say country_name, so edited the command and it worked!
6.	Line 20 ‘T’ missing from HTTPS. Once added it pulled the weather through.
7.	Temperature too high – should be in Celsius not Fahrenheit. Unable to change the temp so amended the C to an F as a quick win!

# Further notes and links
Using Markdown: https://www.markdownguide.org/getting-started

Bash script If statements: https://www.youtube.com/watch?v=elrbjYdL-8c

Re error 2: googled the URL from script, researched JSON/JQ. Link: https://www.w3schools.com/whatis/whatis_json.asp. Bash jq command search link: https://linuxhint.com/bash_jq_command/. Learned jq isn’t a built-in command, you have to install it. Previous link also gives video on how to install. Followed this using sudo apt-get install jq (command was for Ubuntu but decided to give it a shot and it worked!) 

How to work with JSON in BASH using jq? (devdojo.com) https://devdojo.com/bobbyiliev/how-to-work-with-json-in-bash-using-jq

What is $ in bash https://stackoverflow.com/questions/6834487/what-is-the-dollar-question-mark-variable-in-shell-scripting

What is $ in bash https://askubuntu.com/questions/833833/what-does-command-do#:~:text=The%20dollar%20sign%20before%20the%20thing%20in%20parenthesis,calling%20on%20and%20declaring%20variables%20goes%20as%20such%3A

Special characters in bash https://www.howtogeek.com/439199/15-special-characters-you-need-to-know-for-bash/

Fahrenheit to Celsius in bash https://www.tutorialsandyou.com/bash-shell-scripting/fahrenheit-to-celsius-42.html

Fahrenheit to Celsius in bash https://bash.cyberciti.biz/decision-making/fahrenheit-to-celsius-temperature-conversion/

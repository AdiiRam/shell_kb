# Introduction 

Welcome to the Shell Knowledge Base , shell_kb for short. Here you will find all shell commands and scripts , that I have found to be useful on numerous occasions. 

# Purpose 

For most of the development activities , I often find myself trying to recollect the steps that I did to achieve the specific task. All I could remember was the shell command that I used, but not the exact arguments or configurations that I used to do the specific task . 

So ,here I have started to note down them , in the hope that it is useful to others and also I can come back here anytime and maybe reuse the scripts for some other task . 

So feel free to go through them and use in your applications as needed.

# Resources 

#### Split CSV Files along with Header 

A [simple script](resources/split_csvfiles_with_headers.sh) that helps in splitting a large csv into multiple files retaining the header if provided. 

```bash

 Usage :  split_csvfiles_with_headers.sh -h -i <InputFile> -p <Prefix> -l <No of Lines>

         Example : split_csvfiles_with_headers.sh -h -i test.csv -p part_ -l 50
         
``` 




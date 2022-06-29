*** Settings ***
Library    OperatingSystem

*** Variables ***
${output_directory} =    Outputs
${directory_1} =    first directory
${directory_2} =    second directory
${file_1} =    file1.txt
${file_2} =    file2.txt
${file_3} =    file3.txt

*** Keywords ***
Create the base directory
    create directory    ${output_directory}
    should exist    ${output_directory}

Create directory 1
    ${directory_path} =    join path    ${output_directory}    ${directory_1}
    create directory    ${directory_path}
    should exist    ${directory_path}

Create directory 2
    ${directory_path} =    join path    ${output_directory}    ${directory_2}
    create directory    ${directory_path}
    should exist    ${directory_path}

Create first file
    ${file_path} =    join path    ${output_directory}    ${directory_1}    ${file_1}
    create file    ${file_path}    this is some text file in file 1
    should exist    ${file_path}

Create second file
    ${file_path} =    join path    ${output_directory}    ${directory_2}    ${file_2}
    create file    ${file_path}    this is some text file in file 2
    should exist    ${file_path}

Create third file
    ${file_path} =    join path    ${output_directory}    ${directory_1}    ${file_3}
    create file    ${file_path}    this is some text file in file 1
    should exist    ${file_path}

Move/Copy file
    ${source_path} =    join path    ${output_directory}    ${directory_1}    ${file_3}
    ${target_path} =    join path    ${output_directory}    ${directory_2}    ${file_3}

    move file    ${source_path}    ${target_path}
    #copy file    ${source_path}    ${target_path}

    should exist    ${target_path}
    should not exist    ${source_path}

*** Test Cases ***
test case
    create the base directory
    create directory 1
    create directory 2
    create first file
    create second file
    create third file
    move/copy file
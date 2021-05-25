*** Settings ***
Documentation    Suite description
Library  DatabaseLibrary
Library  OperatingSystem

Suite Setup  Connect To database     pymysql     ${DBName}     ${DBUser}     ${DBPass}   ${DBHost}   ${DBPort}

*** Variables ***
${DBName}    demo
${DBUser}    root
${DBPass}    Siddhi@123
${DBHost}    127.0.0.1
${DBPort}    3306

*** Test Cases ***
#CreatePerson Table
#    ${output}=   Execute Sql string  CREATE TABLE person (id integer,Firstname VARCHAR(45),Lastname VARCHAR(45));
#
#    log to console   ${output}

Insert Entryin table
    ${output}=   Execute Sql string  insert into person values (101,"siddhika","pawar")
    log to console   ${output}

*** Keywords ***
Provided precondition
    Setup system under test
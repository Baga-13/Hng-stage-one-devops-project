# DevOps Task: Linux User Creation Bash Script

## Introduction

In this article, we'll discuss a bash script named `create_users.sh` that automates the creation of Linux users and groups based on a given input file. This script ensures that users are created with appropriate home directories, are added to specified groups, and that their passwords are generated and stored securely.

## Script Explanation

### Input File Format

The input file should contain lines formatted as `user;groups`, where each user can belong to multiple groups separated by commas. For example:


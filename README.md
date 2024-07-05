The following operations were carried out

- Creates users and their personal groups.
- Adds users to specified groups.
- Sets up home directories with appropriate permissions.
- Generates random passwords for the users.
- Logs all actions.
- Stores passwords securely.

The input file should contain lines formatted as `user;groups`. Each user can belong to multiple groups, separated by commas. For Example

"light;sudo,dev,www-data
bayo;sudo
wisdom;dev,www-data"


### Script Workflow

1. Argument Check: The script checks if a filename is provided as an argument.
2. File and Directory Setup: Necessary directories are created, and log and password files are cleared.
3. User Creation Function: A function `create_user` is defined to create users, set passwords, and handle group assignments.
4. Reading Input File: The script reads the input file line by line and calls the `create_user` function for each user.

### Logging and Security

1. Actions are logged to `/var/log/user_management.log`.
2. Passwords are stored securely in `/var/secure/user_passwords.csv` with restricted permissions.


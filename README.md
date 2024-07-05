The folowing operations were carried out

- Creates users and their personal groups.
- Adds users to specified groups.
- Sets up home directories with appropriate permissions.
- Generates random passwords for the users.
- Logs all actions.
- Stores passwords securely.

The input file should contain lines formatted as `user;groups`. Each user can belong to multiple groups, separated by commas. For Example

light;sudo,dev,www-data
idimma;sudo
mayowa;dev,www-data


### Script Workflow

1. **Argument Check**: The script checks if a filename is provided as an argument.
2. **File and Directory Setup**: Necessary directories are created, and log and password files are cleared.
3. **User Creation Function**: A function `create_user` is defined to create users, set passwords, and handle group assignments.
4. **Reading Input File**: The script reads the input file line by line and calls the `create_user` function for each user.

### Logging and Security

- Actions are logged to `/var/log/user_management.log`.
- Passwords are stored securely in `/var/secure/user_passwords.csv` with restricted permissions.


This script simplifies the process of user and group management in a Linux environment. It ensures that users are created with the correct settings and their passwords are stored securely.

For more information about the HNG Internship, visit:
- [HNG Internship](https://hng.tech/internship)
- [HNG Hire](https://hng.tech/hire)
- [HNG Premium](https://hng.tech/premium)


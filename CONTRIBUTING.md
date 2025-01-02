# Contribution Guide

Note: Only contributions that follow these requirements will be accepted.

# Contribution Types

## Bug Reports
To report bugs, make sure there are no similar ones already open in [Github issues](https://github.com/Flutterando/getapps/issues)
- Detailed description of the problem
- Steps to reproduce the problem
- Version of the software where the problem was found
- Expected behavior
- Screenshots or logs, if applicable
- Information about the environment where the problem occurred

## Bug Fixes
To contribute with bug fixes:
1. Check if the problem has already been reported in [Github issues](https://github.com/Flutterando/getapps/issues).
2. Select an issue you would like to resolve.
3. Comment on the issue to request to work on the fix.
4. Follow the instructions in the "How to Contribute" section below to submit your fix.

## New Features
To request new features, make a brief description of the feature in [Github issues](https://github.com/Flutterando/getapps/issues)
- A clear description of the desired feature
- Wait for the team's evaluation on the implementation of the feature

## Documentation
If you want to contribute to the documentation or any improvement:
1. Open an (issue)[https://github.com/Flutterando/getapps/issue].
2. Make the changes or additions.
3. Follow the instructions in the "How to Contribute" section below to submit your updates.

# How to Contribute
1. **Fork the repository**: Click the "Fork" button in the upper right corner of the repository page.
2. **Clone the repository**: Clone your fork locally using the command:
    ```sh
    git clone https://github.com/your-username/getapps.git
    ```
3. **Create a branch**: Create a new branch for your contribution:
    ```sh
    git checkout -b my-contribution
    ```
4. **Make the changes**: Make the necessary changes to the code.
5. **Commit your changes**: Commit your changes with a descriptive message:
    ```sh
    git commit -m "Description of my changes"
    ```
6. **Push to your fork**: Push your changes to your fork on GitHub:
    ```sh
    git push origin my-contribution
    ```
7. **Open a Pull Request**: In the original repository, click the "New Pull Request" button and select your branch.
   1. The title of the pull request must always follow the [semantic commit](https://www.conventionalcommits.org/en/v1.0.0/) standard.

## Requirements
- Format the code according to the `analysis_options.yaml` file.
- Make sure the code is well documented.
- Write tests for your changes and make sure all existing tests pass.

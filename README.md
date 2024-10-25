# Geiger Tools
 A multiple packages (monorepo)for GeigerToolbox ecosystem

# apps/
- Contains Flutter apps in this repository. Includes GeigerToolbox( the main app)
- GeigerToolbox_widgetbook (used to showcase widgets/components from geiger_ui_kit)
# packages/: 
Contains micro-packages or internal packages reusable across apps.
  
# Multiple Packages Management Tool
## Melos
A tool for managing Dart & Flutter repositories with multiple packages(monorepo). Support automated versioning via Conventional Commits

# Conventional Commits Cheatsheet
Conventional Commits provide a standardised format for crafting commit messages. This format benefits us in several ways: 

- **Clarity:** Commit messages become easier to understand, reflecting the exact nature of the change introduced.
- **Automation:** Tools like Git hooks and linters can leverage the structure to automate tasks based on commit types.
- **Collaboration:** Consistent commit messages enhance team communication and codebase maintainability.
- **[Cheatsheet](https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13)** 
  
# How contribute to this repository
  * Run the command to install melos :  `dart pub global activate melos` 
  * Clone this project
  * Create your flutter/dart app or package inside either apps or packages directories.
  * Navigate to the root directory and bootstrap(install and link, dependencies and packages respectively) your melos workspace: `melos bootstrap`
  * Make your git commit following the conventional commits rule [Cheatsheet](https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13)
  * Run the command to generate a new version of your package/app: `melos version` 

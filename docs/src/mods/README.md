Changes made by developers for releases should go in subdirectories here.  Only .doc or .docx files are allowed in this folder, and should **definitely** not be the whole version of the file being modified.  The process should be:
- Make sure your version of the doc file is up to date by doing a git pull on this repository
- Open the doc file:
  - _Save As_ in a subdirectory here for the particular release being targeted, with a new, descriptive name.
  - **DO NOT PUSH YET**
- In the new file:
  - Turn **off** track changes
  - Delete all the stuff before and after the section you want to modify
  - Turn **on** track changes
  - Make changes
  - Push this file, which should be small, up to the repo
As each release approaches, the person responsible for updating documentation will then go in and merge all the changes with the master file.  

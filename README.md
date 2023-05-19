# EasyBirthdays

4/18/2023
forms creation, edit page update, create page creation, storage.dart variables creation


4/30/2023
Have not updated in a while. Lots of new features. I created a settings page to change the color of the app. I have to get a new dependency called provider which will rebuild the app each time I change the colorSettings variable.

Got experience using "Provider". Provider.of<ColorProvider>(context).colorSetting, - We can store global variables using this.

In main.dart, I created multiple providers. So I had to use a multi provider constructor method to allow for both.

4/30/2023 - Update 2
Put the list view in a card widget, then added a delete button. Removed the labels for a cleaner view.
Deleted create.dart since everything can be done in event.dart. Added buttons for deletion and edits. Added creation button below which takes from create.dart setup. Overall simplifying the code


5/1/2023
Added in camera features
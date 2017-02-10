# Instructions for Unit 2 Challenge

## Requirements

Please fork and clone this repository, then watch the screen recording provided before starting. The included screen recording demonstrates the application you are to create for this challenge.

Note the following requirements:

1. Initial screen shows a list of items on a shopping list.
2. Each row shows the item's name, and a checkbox to indicate if it has been purchased or not.
3. Tapping the plus button in the top right corner brings up an alert with a text field to add an item. Tapping the Save button saves the new item and returns to the list. Tapping cancel closes the alert without creating an item.
4. Tapping on the checkbox for an item toggles the state of that checkbox.
5. If the app is killed and restarted, previously saved items must continue to be shown. Persistence *must* be done using Core Data.
6. User can swipe to delete existing notes.
7. Application is built using proper MVC, and the Core Data patterns taught in this unit.

### Black Diamonds
	- Use an NSFetchedResultsController, add a property to your model object called ```category```, and split your sections based on that property
	- Add a due date to your shopping list items

## Covered Concepts

This challenge is intended to assess your ability to build applications that use Core Data for persistence, and make use of UIAlertController, and custom UITableViewCell subclasses. It also requires understanding and use of custom protocols and the delegate pattern in your own code. It builds upon unit 1 by continuing to cover table views, outlets and actions, etc. It covers the following concepts taught in Unit 2:

  - Persist date using Core Data, including
  	- Creation of Core Data models
  	- Use of NSPersistentContainer
  	- Performing fetch requests
  	- Creation and deletion of NSManagedObjects
  	- Saving
  - Implementation of a custom protocol following the delegate pattern
  - Identification, display, and response to user responses from an Alert Controller
  - Use of proper Model-View-Controller principles
  - Systematically plan out each class needed for an MVP product
  - Implement intermediate Table View features (including a custom cell and cell delegate)
  - Use best practices for proper database design
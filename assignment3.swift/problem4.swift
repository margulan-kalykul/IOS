import Foundation

var shoppingList: [String] = []

while true {
    print("1. Add Item")
    print("2. Remove Item")
    print("3. View Shopping List")
    print("4. Exit")
    print("Please select an option from above (1-4): ")

    if let choice = readLine() {
        switch choice {
        case "1":
            // Add Item
            print("Enter the item to add: ")
            if let item = readLine(), !item.isEmpty {
                shoppingList.append(item)
                print("\(item) has been added to the shopping list")
            } 
            else {
                print("Invalid item")
            }
        case "2":
            // Remove Item
            print("Enter the item to remove: ")
            if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                shoppingList.remove(at: index)
                print("\(item) has been removed from the shopping list")
            } 
            else {
                print("Item not found in the shopping list")
            }
        case "3":
            // View Shopping List
            if shoppingList.isEmpty {
                print("Shopping list is empty")
            } 
            else {
                print("Shopping List: ")
                for item in shoppingList {
                    print("*\(item)")
                }
            }
        case "4":
            // Exit
            exit(0)
        default:
            print("Invalid choice. Select a number between 1 and 4: ")
        }
    }
}

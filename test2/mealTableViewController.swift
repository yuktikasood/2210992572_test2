//
//  mealTableViewController.swift
//  test2
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class mealTableViewController: UITableViewController {
    var meals:[Meal]{
            // Example of recipes for breakfast, lunch, and dinner

            let breakfastRecipes = [
                Recipe(name: "Avocado Toast", ingredients: ["Avocado", "Bread", "Olive Oil", "Lemon"], instructions: ["Toast the bread", "Mash avocado with lemon and olive oil", "Spread avocado on toast"], calories: 280, category: "Vegan"),
                Recipe(name: "Smoothie Bowl", ingredients: ["Frozen Berries", "Banana", "Almond Milk", "Granola"], instructions: ["Blend berries, banana, and almond milk", "Top with granola"], calories: 350, category: "Vegetarian")
            ]

            let lunchRecipes = [
                Recipe(name: "Quinoa Salad", ingredients: ["Quinoa", "Cucumber", "Tomatoes", "Olive Oil", "Lemon", "Feta Cheese"], instructions: ["Cook quinoa", "Chop vegetables", "Toss quinoa and vegetables with olive oil, lemon, and feta"], calories: 400, category: "Vegetarian"),
                Recipe(name: "Chicken Caesar Wrap", ingredients: ["Grilled Chicken", "Lettuce", "Caesar Dressing", "Tortilla"], instructions: ["Grill chicken", "Wrap chicken, lettuce, and dressing in tortilla"], calories: 500, category: "Non-Vegetarian")
            ]

            let dinnerRecipes = [
                Recipe(name: "Vegetable Stir Fry", ingredients: ["Broccoli", "Carrots", "Bell Peppers", "Soy Sauce", "Rice"], instructions: ["Stir-fry vegetables in soy sauce", "Serve over rice"], calories: 350, category: "Vegan"),
                Recipe(name: "Salmon with Asparagus", ingredients: ["Salmon", "Asparagus", "Lemon", "Olive Oil"], instructions: ["Bake salmon and asparagus with olive oil and lemon"], calories: 450, category: "Non-Vegetarian")
            ]

            
            
            let breakfast = Meal(name: "Breakfast", recipes: breakfastRecipes)
            let lunch = Meal(name: "Lunch", recipes: lunchRecipes)
            let dinner = Meal(name: "Dinner", recipes: dinnerRecipes)
            
           
           return [breakfast, lunch, dinner]
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func unwindToEmojiTVC(unWindSegue: UIStoryboardSegue){
        
        if unWindSegue.identifier == "cancelsegue"{
            return
        }
        
//        if let sourceVC = unWindSegue.source as? RecipeDetailViewController, let meal = sourceVC.recipy {
//            
//            if let indexPath = tableView.indexPathForSelectedRow{
//                Recipe.remove(at: indexPath.row)
//                Recipe.insert(Recipe, at: indexPath.row)
//              
//                tableView.reloadRows(at: [indexPath], with: .none)
//            }else {
//                Recipe.append(emoji)
//                
//                let indexPath = IndexPath(row: emojis.count - 1, section: 0)
//                tableView.insertRows(at: [indexPath], with: .none)
//            }
//            
//        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].recipes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealCell
            
            let meal = meals[indexPath.row]
        let recipy=meal.recipes[indexPath.row]
            cell.mealNameLabel.text = recipy.name
        cell.calorieLabel.text = String(recipy.calories)
            
            
            return cell
        }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        meals[section].name
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

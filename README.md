# Gilded Rose Kata

## Approach 1: Using Object Oriented Principles

**Full refactoring of the problem adhering to OOP.** 

- Within the GildedRose class, I used a hash and a looping method to serve as a factory (rather than an external factory class). I did this for ease of data management and user update, and to avoid long conditionals.

- The extra manufactured classes will mutate the item instance (unaltered - as per instructions), and then return that item instance back to the same items array.

*To add a new item to the store that does not behave in the standard way, you must do 3 things; 1st, create a new class based on the template of the other exceptional item classes such as AgedBrie or Sulfuras, and implement the behaviour you want on the 'update_quality' polymorphed method. 2nd, add the matching item.name string and appropriate class name to the CLASS_CHOICE hash which is found in the GildedRose class, and 3rd create a new require_relative reference to the new class file at the top of the gilded_rose_OOP file.* 

## Approach 2: Simple for user

**I designed this approach to use the least code. Not only to make the program run and avoid massive conditionals, but also for a new user unacquainted with the previous developers' work to be able to input a new item and its rules with the smallest possible addition of code.**

- Keeping all code within the GildedRose class, I added 2 new methods and a hash. Update_quality method loops through all items and calls these 2 methods on them. 

- 1 method covers common behaviour (bounding quality values and moving sell_in day on by one) 

- The other method covers the quality change. The default arguments the method operates with mean that in the absense of calling the method with arguments, the defaults will be used (which is as wanted). Any arguments provided will over-ride the defaults and mutate the item.quality as desired. The loop will look in the hash for a item.name match, and if it finds will then take the array of values and provide it to the function as a set of arguments, allowing a user to input a new abnormal item as a single new entry into the hash. The downside here is the complexity that may ensue if new quality changing behaviour were needed (eg multiply x2 for each day closer to sell_in), as you'd need to add new arguments to the alter_indiv_params method.

*To add a new item to the store that does not behave in the standard way, all you need to do is add the item.name to the ITEM_PARAMS hash in the GildedRose class, along with the parameters you want it to input to the method as a hash. eg { "Conjured Item" => [-2,-4] }. If you need to add further quality-altering behaviour that is not presently coded for, then you can add additional arguments to the alter_indiv_params method, and provide a default of 0 so that other item types still behave as expected without explicit input.*


### Kata Instructions:

This is a well known kata developed by Terry Hughes. This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code.
Here is the text of the kata:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

Once the sell by date has passed, Quality degrades twice as fast
The Quality of an item is never negative
“Aged Brie” actually increases in Quality the older it gets
The Quality of an item is never more than 50
“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:
“Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

The brief:
Choose legacy code (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

You don't need to clone the repo if you don't want to. Feel free to copy the ruby code into a new folder and write your tests from scratch.

HINT: Test first FTW!
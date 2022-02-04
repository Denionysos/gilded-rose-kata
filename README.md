# Gilded Rose Kata

The objective of this kata is to practice refactoring. This kata motivates the need for refactoring as follows:

* The implementation is spaghetti code, and difficult to glean context.
* The tests of the current implementation pass, but there are a number of pending tests.
* You are asked to implement the code to get the pending tests to pass.
* This isn't easy, because the implementation is so messy.
* Consider using the passing tests to refactor the code to make it more habitable before implementing new functionality.
Also known as a [preparatory refactoring](http://martinfowler.com/articles/workflowsOfRefactoring/#preparatory).

It may help you to understand the problem domain if you know that the
[Gilded Rose](http://wowwiki.wikia.com/wiki/Gilded_Rose) is an inn from the World of Warcraft.

## Problem description

Hi and welcome to team Gilded Rose. As you know, we are a small inn
with a prime location in a prominent city run by a friendly innkeeper
named Allison. We also buy and sell only the finest
goods. Unfortunately, our goods are constantly degrading in quality as
they approach their sell by date. We have a system in place that
updates our inventory for us. It was developed by a no-nonsense type
named Leeroy, who has moved on to new adventures. Your task is to add
the new feature to our system so that we can begin selling a new
category of items. First an introduction to our system:

- All items have a `sell_in` value which denotes the number of days we
  have to sell the item
- All items have a `quality` value which denotes how valuable the item
  is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well, this is where it gets interesting:

  - Once the sell by date has passed, Quality degrades twice as fast
  - The Quality of an item is never negative
  - "Aged Brie" actually increases in Quality the older it gets
  - The Quality of an item is never more than 50
  - "Sulfuras", being a legendary item, never has to be sold or
    decreases in Quality
  - "Backstage passes", like aged brie, increases in Quality as its
    sell by date approaches; Quality increases by 2 when there are 10
    days or less and by 3 when there are 5 days or less but Quality
    drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires
an update to our system:

- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the `update_quality` method and add
any new functions, as long as everything still works correctly.
However, do not alter the `Item` class or the `items` property as those
belong to the goblin in the corner who will insta-rage and one-shot you
as he doesn't believe in shared code ownership. Your work needs to be
completed by Friday, February 18, 2011 08:00:00 AM PST.

Just for clarification, an item can never have its Quality increase
above 50, however "Sulfuras" is a legendary item and as such its
Quality is 80 and it never alters.

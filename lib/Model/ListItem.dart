class ListItem {

  final String itemName;
  final bool isDone;

  ListItem(this.itemName, this.isDone);

  var item1 = new ListItem("ItemOne", false);
  var item2 = new ListItem("ItemTwo", false);
  var item3 = new ListItem("ItemThree", false);

  List<ListItem> listItems = new List();

}
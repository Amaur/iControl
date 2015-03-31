function adddoc(db,word) {
    /* Indexes do not work on top-level fields. So put everything
       in the document in a dict called "things" so that they're
       not top-level fields any more.
       https://bugs.launchpad.net/u1db-qt/+bug/1271972 */
    if(inp.text !=""){
        db.putDoc({things: {type: "place", placename: word}});}
    return inp.text = ""
};

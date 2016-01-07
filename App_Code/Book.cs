using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Book
{
    private int bookid;
    private string isbn;
    private string bookname;
    private string bookauthor;

    public Book()
    { 
    }
    public int Bookid
    {
        get { return bookid; }
        set { bookid = value; }
    }
    public string Isbn
    {
        get { return isbn; }
        set { isbn = value; }
    }
    public string Bookauthor
    {
        get { return bookauthor; }
        set { bookauthor = value; }
    }
    public string Bookname
    {
        get { return bookname; }
        set { bookname = value; }
    }
}
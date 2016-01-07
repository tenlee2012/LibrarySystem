using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4.admin
{
    public partial class bookmanger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string res = PermControl.CheckUserType(Session["usertype"], 0);
            if (res != "")
            {
                Response.Write(res);
            }
        }
        protected void GridView1_SelectedIndexChanged(Object sender, EventArgs e)
        {
            Response.Redirect("bookinfo.aspx?id=" + GridView1.SelectedRow.Cells[0].Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookinfo.aspx?id=" + this.search.Text);
        }

        protected void addbook_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("addbook.aspx");
        }
    }
}
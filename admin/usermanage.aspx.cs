using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4.admin
{
    public partial class usermanage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string res = PermControl.CheckUserType(Session["usertype"], 0);
            if (res != "")
            {
                Response.Write(res);
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("userinfo.aspx?id=" + GridView1.SelectedRow.Cells[0].Text);
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Response.Write("default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string input = this.search.Text;
            Response.Redirect("userinfo.aspx?id=" + input);
        }

        protected void adduser_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("adduser.aspx");
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class bookboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewBind();
        }
        private void GridViewBind()
        {
            GridView1.DataSource = MyUtils.BookBoard(10);
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = MyUtils.BookBoard(10);
            GridView1.DataBind();
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = MyUtils.BookBoard(10);
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string res = PermControl.CheckUserType(Session["usertype"], 3);
            if (res != "")
            {
                Response.Write(res);
            }
            else
            {
                res = MyUtils.AddBag(Session["userid"].ToString(), GridView1.SelectedRow.Cells[0].Text);
                this.addinfo.Text = res;
            }
        }
        protected void GridView1_RowDeleting(Object sender, GridViewDeleteEventArgs e)
        {
            Response.Redirect("bookinfo.aspx?id=" + GridView1.Rows[e.RowIndex].Cells[0].Text);
        }
    }
}
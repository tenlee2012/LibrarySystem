using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class userbag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewBind();
            }
            //this.borinfo.Text = Session["userid"].ToString();
        }

        private void GridViewBind()
        {
            if (Session["userid"] != null)
            {
                string userid = Session["userid"].ToString();
                GridView1.DataSource = MyUtils.GetBookbag(userid);
                GridView1.DataBind();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (Session["userid"] != null)
            {
                string userid = Session["userid"].ToString();

                GridView1.DataSource = MyUtils.GetBookbag(userid);
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                
                string res = MyUtils.BorrowBook(Session["userid"].ToString(), GridView1.SelectedRow.Cells[0].Text);
                this.borinfo.Text = res;
            }
            GridViewBind();
        }
        protected void GridView1_RowDeleting(Object sender, GridViewDeleteEventArgs e)
        {
            if (Session["userid"] != null)
            {
                string res = MyUtils.DeleteBag(Session["userid"].ToString(), GridView1.Rows[e.RowIndex].Cells[0].Text);
                this.borinfo.Text = res;
            }
            GridViewBind();
        }
    }
}
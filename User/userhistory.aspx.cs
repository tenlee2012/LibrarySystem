using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class userhistory : System.Web.UI.Page
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
                GridView1.DataSource = MyUtils.GetHistoryBorrow(userid);
                GridView1.DataBind();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (Session["userid"] != null)
            {
                string userid = Session["userid"].ToString();

                GridView1.DataSource = MyUtils.GetHistoryBorrow(userid);
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
            }
            GridViewBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "go")
            {
                try
                {
                    TextBox tb = (TextBox)GridView1.BottomPagerRow.FindControl("inPageNum");
                    int num = Int32.Parse(tb.Text);
                    GridViewPageEventArgs ea = new GridViewPageEventArgs(num - 1);
                    GridView1_PageIndexChanging(null, ea);
                }
                catch
                {
                }
            }
        }
    }
}
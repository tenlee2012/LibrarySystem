using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class nowbook : System.Web.UI.Page
    {
        public int flag = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewBind();
            }
        }
        private void GridViewBind()
        {
            if (Session["userid"] != null)
            {
                string userid = Session["userid"].ToString();
                GridView1.DataSource = MyUtils.GetNowBorrow(userid);
                GridView1.DataBind();
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (Session["userid"] != null)
            {
                string userid = Session["userid"].ToString();

                GridView1.DataSource = MyUtils.GetNowBorrow(userid);
                GridView1.DataBind();
            }
        }
        protected void GridView1_RowCommand(object sender,GridViewCommandEventArgs e)
        {
            if (e.CommandName == "renew")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                DateTime nowdate = DateTime.Now;
                DateTime shouldreturndate = Convert.ToDateTime(row.Cells[4].Text);
                if (Session["userid"] != null)
                {
                    if (DateTime.Compare(nowdate, shouldreturndate) > 0)
                    {
                        this.renewinfo.Text = "超过规定还书日期，请到服务台还书,不能续借！";
                    }
                    else
                    {
                        this.renewinfo.Text = MyUtils.Renew(row.Cells[0].Text);
                    }
                    flag = 1;
                }
            }
            else if (e.CommandName == "returnbook")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                DateTime nowdate = DateTime.Now;
                DateTime shouldreturndate = Convert.ToDateTime(row.Cells[4].Text);
                if (Session["userid"] != null)
                {
                    if (DateTime.Compare(nowdate, shouldreturndate) > 0)
                    {
                        this.renewinfo.Text = "超过规定还书日期，请到服务台还书！";
                    }
                    else
                    {
                        string res = MyUtils.ReturnBook(row.Cells[0].Text);
                        this.renewinfo.Text = res;
                    }
                    flag = 1;
                }
            }
            else if (e.CommandName == "go")
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
            GridViewBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Display the company name in italics.
                if (e.Row.Cells.Count == 1) return;
                DateTime nowdate = DateTime.Now;
                DateTime shouldreturndate = Convert.ToDateTime(e.Row.Cells[4].Text);

                e.Row.Cells[5].Enabled = DateTime.Compare(nowdate, shouldreturndate) < 0;
            }
        }
    }
}
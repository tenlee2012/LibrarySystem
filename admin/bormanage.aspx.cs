using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4.admin
{
    public partial class bormanage : System.Web.UI.Page
    {
        public int flag = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string res = PermControl.CheckUserType(Session["usertype"], 0);
            if (res != "")
            {
                Response.Write(res);
            }
            if (!IsPostBack)
            {
                GridViewBind();
            }
        }
        private void GridViewBind()
        {
            string searchinfo = this.DropDownList1.Text;
            if (searchinfo == "未还书")
            {
                GridView1.DataSource = MyUtils.AllUserNowBorrow();
                GridView1.DataBind();
            }
            else if(searchinfo == "已还书")
            {
                GridView2.DataSource = MyUtils.AllUserHisBorrow();
                GridView2.DataBind();
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (this.DropDownList1.SelectedValue == "未还书")
            {
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
            else
            {
                GridView2.PageIndex = e.NewPageIndex;
                GridView2.DataBind();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (this.DropDownList1.SelectedValue == "未还书")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                DateTime nowdate = DateTime.Now;
                DateTime shouldreturndate = Convert.ToDateTime(row.Cells[4].Text);
                if (e.CommandName == "renew")
                {
                    this.addinfo.Text = MyUtils.Renew(row.Cells[0].Text);
                    flag = 1;
                }
                else if (e.CommandName == "returnbook")
                {
                    string res = MyUtils.ReturnBook(row.Cells[0].Text);
                    this.addinfo.Text = res;
                    flag = 1;
                }
            }
            
            GridViewBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridViewBind();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication4
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewBind();
            } 
        }

        private void GridViewBind()
        {
            string searchinfo = this.SearchInput.Text;
            int searchtype = this.DropDownList1.SelectedIndex;

            GridView1.DataSource = MyUtils.searchBook(searchinfo, searchtype);
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        { 
            GridView1.PageIndex = e.NewPageIndex;
            string searchinfo = this.SearchInput.Text;
            int searchtype = this.DropDownList1.SelectedIndex;
            if (searchinfo != "")
            {
                GridView1.DataSource = MyUtils.searchBook(searchinfo, searchtype);
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = MyUtils.searchBook(searchinfo, searchtype);
                GridView1.DataBind();
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            string searchinfo = this.SearchInput.Text;
            int searchtype = this.DropDownList1.SelectedIndex;

            GridView1.DataSource = MyUtils.searchBook(searchinfo, searchtype);
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
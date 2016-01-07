using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace WebApplication4
{
    public partial class bookinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                ShowBook();
            }
        }
        protected void ShowBook()
        {
            string strsql = "select * from lib_book where bookid=@bookid";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            conn.Open();
            cmd.Parameters.Add("@bookid", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["id"].ToString());

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            dr.Read();
            if (dr.HasRows)
            {
                this.Image1.ImageUrl = dr.GetValue(12).ToString();
                this.bookname.Text = dr.GetValue(2).ToString();
                this.bookauthor.Text = dr.GetValue(3).ToString();
                this.bookpub.Text = dr.GetValue(4).ToString();
                this.bookpubdate.Text = dr.GetValue(5).ToString();
                this.bookdes.Text = dr.GetValue(7).ToString();
                this.booktotal.Text = dr.GetValue(8).ToString();
                this.bookres.Text = dr.GetValue(9).ToString();
            }
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string res = PermControl.CheckUserType(Session["usertype"], 3);
            if (res != "")
            {
                Response.Write(res);
            }
            else
            {
                res = MyUtils.AddBag(Session["userid"].ToString(), Request.QueryString["id"].ToString());
                this.addinfo.Text = res;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string res = PermControl.CheckUserType(Session["usertype"], 3);
            if (res != "")
            {
                Response.Write(res);
            }
            else
            {
                res = MyUtils.BorrowBook(Session["userid"].ToString(), 
                    Request.QueryString["id"].ToString());
                this.addinfo.Text = res;
            }
        }
    }
}
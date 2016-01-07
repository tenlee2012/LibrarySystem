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

namespace WebApplication4.admin
{
    public partial class bookinfo : System.Web.UI.Page
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
                SetBookInfo();
            }
        }
        protected void SetBookInfo()
        {
            if (Request.QueryString["id"] == null) return;
            int bookid = Convert.ToInt32(Request.QueryString["id"].ToString());
            string strsql = "select * from lib_book where bookid=@bookid";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            cmd.Parameters.Add("@bookid", SqlDbType.Int).Value = bookid;
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                this.ISBN.Text = dr["ISBN"].ToString();
                this.bookname.Text = dr["bookname"].ToString();
                this.bookauthor.Text = dr["bookauthor"].ToString();
                this.bookpub.Text = dr["bookpub"].ToString();
                this.bookpubdate.Text = dr["bookpubdate"].ToString();
                this.bookprice.Text = dr["bookprice"].ToString();
                this.booktotal.Text = dr["booktotal"].ToString();
                this.bookres.Text = dr["bookres"].ToString();
                this.bookindate.Text = dr["bookindate"].ToString();
                this.Image1.ImageUrl = dr["bookphoto"].ToString();
                this.bookdes.Text = dr["bookdes"].ToString();
            }
            dr.Close();
            conn.Close();
        }
        protected string Upload_Image(string isbn)
        {
            string file_name = "";
            bool fileIsValid = false;
            if (this.FileUpload1.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(this.FileUpload1.FileName).ToLower();
                string[] restrictExtension = { ".gif", ".jpg", ".bmp", ".png" };
                for (int i = 0; i < restrictExtension.Length; i++)
                {
                    if (fileExtension == restrictExtension[i])
                    {
                        fileIsValid = true; break;
                    }
                }
                Response.Write(FileUpload1.FileName + fileExtension);
                if (fileIsValid)
                {
                    try
                    {
                        /*this.Image1.ImageUrl = "~/images/bookimages/" 
                            + FileUpload1.FileName;*/
                        this.FileUpload1.SaveAs(Server.MapPath("~/images/bookimages/")
                            + isbn + fileExtension);
                        file_name = "~/images/bookimages/" + isbn + fileExtension;
                    }
                    catch (Exception e)
                    {
                        //throw new Exception(e.Message, e);
                    }
                    finally { }

                }
            }
            return file_name;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int bookid = Convert.ToInt32(Request.QueryString["id"].ToString());
            string isbn = this.ISBN.Text;
            string bookname = this.bookname.Text;
            string bookauthor = this.bookauthor.Text;
            string bookpub = this.bookpub.Text;
            string bookpubdate = this.bookpubdate.Text;
            double bookprice = Convert.ToDouble(this.bookprice.Text);
            string bookdes = this.bookdes.Text;
            int booktotal = Convert.ToInt32(this.booktotal.Text);
            int bookres = Convert.ToInt32(this.bookres.Text);
            string bookindate = this.bookindate.Text;
            string bookphoto = Upload_Image(isbn);
            if (bookphoto == "" && this.FileUpload1.HasFile)
            {
                this.addinfo.Text = "图片添加失败";
                flag = 1;
                return;
            }
            if (bookphoto == "")
            {
                bookphoto = this.Image1.ImageUrl;
            }
            string strsql = "update lib_book set ISBN=@ISBN,bookname=@bookname," +
                "bookauthor=@bookauthor,bookpub=@bookpub," +
                "bookpubdate=@bookpubdate,bookprice=@bookprice,"+
                "bookdes=@bookdes,booktotal=@booktotal," +
                "bookres=@bookres,bookindate=@bookindate," +
                "bookphoto=@bookphoto where bookid=@bookid";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            cmd.Parameters.Add("@bookid", SqlDbType.Int).Value = bookid;
            cmd.Parameters.Add("@bookname", SqlDbType.VarChar).Value = bookname;
            cmd.Parameters.Add("@ISBN", SqlDbType.VarChar).Value = isbn;
            cmd.Parameters.Add("@bookauthor", SqlDbType.VarChar).Value = bookauthor;
            cmd.Parameters.Add("@bookpub", SqlDbType.VarChar).Value = bookpub;
            cmd.Parameters.Add("@bookpubdate", SqlDbType.DateTime).Value = bookpubdate;
            cmd.Parameters.Add("@bookprice", SqlDbType.Float).Value = bookprice;
            cmd.Parameters.Add("@bookdes", SqlDbType.VarChar).Value = bookdes;
            cmd.Parameters.Add("@booktotal", SqlDbType.Int).Value = booktotal;
            cmd.Parameters.Add("@bookres", SqlDbType.Int).Value = bookres;
            cmd.Parameters.Add("@bookindate", SqlDbType.DateTime).Value = bookindate;
            cmd.Parameters.Add("@bookphoto", SqlDbType.VarChar).Value = bookphoto;
            int res = MyUtils.ExecNonQuery(cmd);
            this.addinfo.Text = res == 1 ? "修改成功" : "修改失败";
            flag = 1;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int bookid = Convert.ToInt32(Request.QueryString["id"].ToString());
            string strsql = "delete from lib_book where bookid=@bookid";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            cmd.Parameters.Add("@bookid", SqlDbType.Int).Value = bookid;
            int result = MyUtils.ExecNonQuery(cmd);
            if (result == 1)
            {
                Response.Redirect("bookmanage.aspx");
            }
        }
    }
}
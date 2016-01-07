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
    public partial class addbook : System.Web.UI.Page
    {
        public int flag = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string res = PermControl.CheckUserType(Session["usertype"], 0);
            if (res != "")
            {
                Response.Write(res);
            }
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
                    catch(Exception e)
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
            
            string isbn = this.ISBN.Text;
            string bookname = this.bookname.Text;
            string bookauthor = this.bookauthor.Text;
            string bookpub = this.bookpub.Text;
            string bookpubdate = this.bookpubdate.Text;
            double bookprice = Convert.ToDouble(this.bookprice.Text);
            string bookdes = this.bookdes.Text;
            int booktotal = Convert.ToInt32(this.booktotal.Text);
            int bookres = booktotal;
            string bookindate = this.bookindate.Text;
            int typeid = 1;
            string bookphoto = Upload_Image(isbn);
            if (bookphoto == "" && this.FileUpload1.FileName != "")
            {
                this.addinfo.Text = "图片添加失败";
                flag = 1;
                return;
            }
            string strsql = "insert into lib_book(ISBN,bookname,bookauthor,bookpub,"+
                "bookpubdate,bookprice,bookdes,booktotal,bookres,typeid,bookindate,"+
                "bookphoto)values(@ISBN,@bookname,@bookauthor,@bookpub," +
                "@bookpubdate,@bookprice,@bookdes,@booktotal,@bookres,"+
                "@typeid,@bookindate,@bookphoto)";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            cmd.Parameters.Add("@bookname", SqlDbType.VarChar).Value = bookname;
            cmd.Parameters.Add("@ISBN", SqlDbType.VarChar).Value = isbn;
            cmd.Parameters.Add("@bookauthor", SqlDbType.VarChar).Value = bookauthor;
            cmd.Parameters.Add("@bookpub", SqlDbType.VarChar).Value = bookpub;
            cmd.Parameters.Add("@bookpubdate", SqlDbType.DateTime).Value = bookpubdate;
            cmd.Parameters.Add("@bookprice", SqlDbType.Float).Value = bookprice;
            cmd.Parameters.Add("@bookdes", SqlDbType.VarChar).Value = bookdes;
            cmd.Parameters.Add("@booktotal", SqlDbType.Int).Value = booktotal;
            cmd.Parameters.Add("@bookres", SqlDbType.Int).Value = bookres;
            cmd.Parameters.Add("@typeid", SqlDbType.Int).Value = typeid;
            cmd.Parameters.Add("@bookindate", SqlDbType.DateTime).Value = bookindate;
            cmd.Parameters.Add("@bookphoto", SqlDbType.VarChar).Value = bookphoto;
            int res = MyUtils.ExecNonQuery(cmd);
            this.addinfo.Text = res == 1 ? "添加成功" : "添加失败";
            flag = 1;
        }
    }
}
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
    public partial class adduser : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userid = this.userid.Text;
            string userpassword = MyUtils.GetMD5(userid);
            string username = this.username.Text;
            string usersex = this.usersex.Text;
            string userredp = this.userredp.SelectedValue.ToString();
            int usertype = Convert.ToInt32(this.usertype.SelectedValue.ToString());
            string strsql = "insert into lib_user(userid,username,userpassword,usersex,"+
                "userredp,userstate,usertype)values(@userid,@username,@userpassword,"
                +"@usersex,@userredp,1,@usertype)";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            cmd.Parameters.Add("@userid",SqlDbType.VarChar).Value = userid;
            cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
            cmd.Parameters.Add("@userpassword", SqlDbType.VarChar).Value = userpassword;
            cmd.Parameters.Add("@usersex", SqlDbType.VarChar).Value = usersex;
            cmd.Parameters.Add("@userredp", SqlDbType.VarChar).Value = userredp;
            cmd.Parameters.Add("@usertype", SqlDbType.Int).Value = usertype;
            int res = MyUtils.ExecNonQuery(cmd);
            this.addinfo.Text = res == 1 ? "添加成功" : "添加失败";
            flag = 1;
        }
    }
}